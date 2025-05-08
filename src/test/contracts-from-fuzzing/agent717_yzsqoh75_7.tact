struct OptionalDeep {
    foo: Int?;
    bar: Bool?;
    nestedOpt: Inner?;
}

struct Inner {
    val: String;
}

contract TestContract {
    o: OptionalDeep;

    init() {
        self.o = OptionalDeep{
            foo: null,
            bar: true,
            nestedOpt: Inner{ val: "hello" },
        };
    }
}