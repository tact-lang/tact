struct DeepInside {
    foo: Int?;
    bar: Int = 123;
}

struct Container {
    val: DeepInside?;
}

contract OptionalNested {
    payload: Container;
    init() {
        self.payload = Container{ val: null };
    }
}