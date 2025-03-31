fun testBoolAugAssign(): Bool {
    let flag: Bool = true;
    flag &&= false;  // expecting flag to become false
    return flag;
}

fun main() {
    testBoolAugAssign();
}
