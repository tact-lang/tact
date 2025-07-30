struct OptionalDeep {
    foo: Inner?;
}

struct Inner {
    bar: String;
}

contract OptionalInside {
    storage: OptionalDeep;

    init() {
        self.storage = OptionalDeep{
            foo: Inner{
                bar: "Hello"
            }
        };
    }
}