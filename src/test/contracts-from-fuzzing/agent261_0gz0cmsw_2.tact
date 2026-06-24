fun ctReturn(flag: Bool): Int {
    if (flag) { return 100; } else { return 200; }
}

contract Test {
    x: Int = ctReturn(true);
}