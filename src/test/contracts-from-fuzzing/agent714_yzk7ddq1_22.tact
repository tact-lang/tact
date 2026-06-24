struct S {
    a: Int;
    b: Bool?;
}

contract AssignOptToDefault {
    val: S;

    init() {
        self.val = S{ a: 7, b: null };
    }
}