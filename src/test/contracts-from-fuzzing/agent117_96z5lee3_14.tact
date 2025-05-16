// Struct with default nested struct field
struct DefNested {
    foo: Int = 1;
    bar: String = "ok";
}

struct Container {
    nested: DefNested = DefNested{};
    msg: String = "hello";
}

contract DefNestedStruct {
    data: Container;

    init() {
        self.data = Container{};
    }
}