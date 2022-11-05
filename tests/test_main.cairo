%lang starknet
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin
from starkware.cairo.common.alloc import alloc

from src.main import sum_even

@external
func test_sum_even{bitwise_ptr: BitwiseBuiltin*}() {
    let (array: felt*) = alloc();
    assert array[0] = 2;
    assert array[1] = 1;

    let (sum) = sum_even(2, array, 0, 0);
    assert 2 = sum;

    return ();
}
