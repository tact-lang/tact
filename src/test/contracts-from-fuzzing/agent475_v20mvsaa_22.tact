// Test empty optional struct field (inner struct optional and null)
struct SomeStruct {
    value: Int;
}

struct Container {
    optInner: SomeStruct?;
}

contract TestContract {
    field: Container;

    init() {
        self.field = Container{
            optInner: null
        };
    }

    receive() {}
}