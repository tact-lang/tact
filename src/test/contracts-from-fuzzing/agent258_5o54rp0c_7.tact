fun ctRepeatReturn(x: Int): Int {
    let i: Int = 0;
    repeat (x) {
        i += 1;
        if (i == 2) { return i; }
    }
    return i;
}

contract Test {
    a: Int = ctRepeatReturn(5);
}
