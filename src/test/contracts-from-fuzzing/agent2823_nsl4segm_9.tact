struct Foo {
    _val: Int;
    bar: Int;
}

contract UnderscoreStartField {
    val: Foo;

    init() {
        self.val = Foo{ _val: 1, bar: 2 };
    }
}