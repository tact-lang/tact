struct Bar {
    x: Int;
}

struct Foo {
    bar: Bar?;
}

struct Wrapper {
    foo: Foo?;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            foo: null,
        };
    }

    receive() {}
}