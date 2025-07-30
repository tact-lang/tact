struct T {
    a: Int;
    b: Bool;
}

contract Reassign {
    s: T;

    init() {
        self.s = T{ a:0, b:true };
    }

    receive() {
        self.s = T{ a: 42, b: false };
    }
}