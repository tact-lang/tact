fun ctReturnTest(flag: Bool): Int {
    if (flag) {
        // Early return with nested condition
        if (flag) { return 111; } else { return 112; }
    } else {
        return 222;
    }
}

contract Test {
    a: Int = ctReturnTest(true);
    b: Int = ctReturnTest(false);
}
