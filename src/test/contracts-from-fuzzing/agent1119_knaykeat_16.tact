struct Foo {
    a: Int = 42;
    b: Bool = true;
    c: String = "bar";
}

contract PartialOpt {
    val: Foo?;

    init() {
        self.val = Foo{ };
    }
}