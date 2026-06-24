fun testMulShiftRightRound(): Int {
    // Expected result: 6
    return mulShiftRightRound(5, 5, 2);
}

fun testMulShiftRightCeil(): Int {
    // Expected result: 7
    return mulShiftRightCeil(5, 5, 2);
}

fun testDivc1(): Int {
    // Expected result: 2
    return divc(3, 2);
}

fun testDivc2(): Int {
    // Expected result: -1
    return divc(-3, 2);
}

fun testLog(): Int {
    // Expected result: 3 (because 10^3 == 1000)
    return log(1000, 10);
}

fun testMod(): Int {
    // As per Tact docs, 1 % -5 should yield -4
    return 1 % -5;
}
