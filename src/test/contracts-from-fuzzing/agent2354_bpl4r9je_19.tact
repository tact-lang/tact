struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract StructDefaultOverride {
    val: S = S{ a: 1, b: false, c: "hi" };

    init() {
        self.val = S{ a: 42, b: true, c: "changed" };
    }
}