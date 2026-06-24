struct Foo {
    nested: Int?;
}

contract OptionalStructDefault {
    val: Foo?;

    init() {
        self.val = Foo{nested:null};
    }
}
