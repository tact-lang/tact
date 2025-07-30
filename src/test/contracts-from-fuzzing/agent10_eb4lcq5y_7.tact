struct S {
    x: Int?;
    y: Bool;
}

contract Defaults {
    val: S;
    init() {
        self.val = S{ x: null, y: true };
    }
    receive() {}
}