// Testing deeply nested optional default fields
struct DeepOptDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
}

struct Holder {
    inner: DeepOptDefaults? = null;
}

contract NestedOptDefs {
    rec: Holder = Holder{};
    init() {
        self.rec = Holder{ inner: DeepOptDefaults{ foo: 5, bar: true, baz: "b" } };
    }
}
