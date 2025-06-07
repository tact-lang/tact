// optional struct at contract level
struct Foo {
    a: Int;
}

contract OptStruct {
    data: Foo?;

    init() {
        self.data = Foo{ a: 42 };
    }
}