struct Both {
    a: Int;
    b: Int;
}

contract Combo(
    param: Both,
) {
    receive() {
        dump(self.param.a + self.param.b);
    }
}