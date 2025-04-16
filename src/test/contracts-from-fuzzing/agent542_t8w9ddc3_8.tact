struct Inner {
    val: Int = 777;
}

struct OuterOpt {
    nested: Inner?;
    info: String = "abc";
}

contract OptionalNestedStruct {
    state: OuterOpt;

    init() {
        self.state = OuterOpt{
            nested: null,
            info: "hello"
        };
    }
}