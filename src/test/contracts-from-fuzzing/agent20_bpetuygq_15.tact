fun testIfMerge(flag: Bool): Int? {
    if (flag) {
        return 1;
    } else {
        return null;
    }
}

contract TestIfMerge {
    receive() {
        testIfMerge(true);
    }
}
