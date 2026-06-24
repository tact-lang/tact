struct Inner {
    val: Int;
}

struct Wrapped {
    data: Inner?;
    text: String;
    flag: Bool;
}

contract OptionalFirst {
    storage: Wrapped;

    init() {
        self.storage = Wrapped{
            data: null,
            text: "Testing",
            flag: true
        };
    }
}