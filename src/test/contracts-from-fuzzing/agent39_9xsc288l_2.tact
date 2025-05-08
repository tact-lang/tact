contract Dummy {}

fun main() {
    let s = initOf Dummy();
    // Testing contractAddressExt with masterchain (-1)
    let addr = contractAddressExt(-1, s.code, s.data);
    // finish without returning any value (void function)
}