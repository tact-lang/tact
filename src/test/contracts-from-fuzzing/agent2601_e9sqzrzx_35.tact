struct S {
    a: Int;
    b: String;
}

contract MultipleAssignments {
    s: S;
    init() {
        self.s = S{ a:1, b:"x" };
    }
    receive() {
        self.s = S{ a:2, b:"y" };
        self.s = S{ a:3, b:"z" };
    }
}