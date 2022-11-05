from starkware.cairo.common.bitwise import bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin

func sum_even{bitwise_ptr: BitwiseBuiltin*}(arr_len: felt, arr: felt*, run: felt, idx: felt) -> (
    sum: felt
) {
    if (arr_len == idx) {
        return (run,);
    }

    let val = arr[idx];

    let (xor) = bitwise_xor(val, 1);
    let new_idx: felt = idx + 1;

    if (xor == val + 1) {
        let new_run = run + val;
        return sum_even(arr_len, arr, new_run, new_idx);
    }

    return sum_even(arr_len, arr, run, new_idx);
}
