fun test2(x: Int): Int {
    if (x == 0) {
        return 10;
    } else {
        return 20;
    }
}

contract T {
    const a: Int = test2(0);
    const b: Int = test2(1);

    receive() {}
}