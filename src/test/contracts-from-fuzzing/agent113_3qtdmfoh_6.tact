struct NestedOptional {
    inner: Complex?;
}

struct Complex {
    foo: Int;
    bar: Bool?;
    baz: Address;
}

contract NestedOptContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: null
        };
    }

    receive() {
        self.data = NestedOptional{
            inner: Complex{
                foo: 10,
                bar: null,
                baz: myAddress()
            }
        };
    }
}
