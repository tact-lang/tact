struct Foo {
    bar: Int?;
}

contract OverwriteOpt {
    val: Foo;

    init() {
        self.val = Foo{ bar: null };
        self.val.bar = 42;
    }
}