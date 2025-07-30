fun testIfElse(): Int {
    // Nested if-else: should select the correct branch
    if (2 + 2 == 3) {
        dump(0);
        return 0;
    } else if (2 + 2 == 4) {
        dump(1);
        return 1;
    } else {
        dump(2);
        return 2;
    }
}

contract Test {
    receive() {
        dump(testIfElse());
    }
}
