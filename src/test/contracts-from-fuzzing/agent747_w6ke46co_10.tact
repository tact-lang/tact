contract TestContract {
    mixedTypes: MixedStruct;

    init() {
        self.mixedTypes = MixedStruct{
            a: 123,
            b: true,
            c: "hello",
            d: null
        };
    }
}

struct MixedStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Inner?;
}

struct Inner {
    flag: Bool;
}
