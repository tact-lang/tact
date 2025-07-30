fun testMulShift() {
    // Valid call: 5*5=25, 2^2=4, floor(25/4)=6
    dump(mulShiftRight(5, 5, 2));

    // Invalid call: using z = -1 should trigger exit code 5 as integer out of expected range
    try {
        dump(mulShiftRight(5, 5, -1));
    } catch (e) {
        dump(e);
    }
}

fun main() {
    testMulShift();
}
