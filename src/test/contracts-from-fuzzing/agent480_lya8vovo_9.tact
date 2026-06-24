struct OptionalInNested {
    x: Int;
    s: String?;
}

struct Container {
    val: OptionalInNested?;
    foo: Bool;
}

contract OptionalOfStruct {
    storage: Container;

    init() {
        self.storage = Container{
            val: null,
            foo: true,
        };
    }
}