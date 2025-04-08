struct Foo {
    x: Int?;
}

contract InitPartialNestedOptional {
    a: Foo?;

    init() {
        self.a = Foo{ x:null };
    }
}