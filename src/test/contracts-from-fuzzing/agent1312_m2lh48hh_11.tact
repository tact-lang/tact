struct OptionalEmbedded {
    foo: Int?;
    bar: Embedded?;
}

struct Embedded {
    s: String;
    b: Bool;
}

contract TestContract {
    data: OptionalEmbedded;

    init() {
        self.data = OptionalEmbedded{
            foo: null,
            bar: Embedded{s: "hi", b: true}
        };
    }
}