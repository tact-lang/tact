fun augAssignTest() {
    let x: Int = 5;
    x += 10;
    x -= 3;
    x *= 2;
    x /= 4;
    x %= 3;
    x &= 7;
    x ^= 2;
    x |= 1;
    return;
}

contract TestAugAssign {
    receive() {
        augAssignTest();
        return;
    }
}
