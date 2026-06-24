// contract with persistent optional struct field, struct also has optionals
struct Foo {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    optFoo: Foo?;

    init() {
        self.optFoo = Foo{
            x: null,
            y: true
        };
    }
}