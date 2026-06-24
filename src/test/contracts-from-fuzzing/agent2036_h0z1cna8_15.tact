struct Nested {
    a: Int;
    b: Bool;
}

contract Test {
    f: Nested?;

    init() {
        self.f = Nested{ a:1, b:true };
    }
}