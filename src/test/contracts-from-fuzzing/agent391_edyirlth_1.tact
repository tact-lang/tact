struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    nested: Inner;

    init() {
        self.nested = Inner{a:1, b:true, c:"abc"};
    }
}