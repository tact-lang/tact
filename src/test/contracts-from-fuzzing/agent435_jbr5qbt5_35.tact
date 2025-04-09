// Contrived struct with mix of default values, explicit serialization, optionals, nested
struct Inner {
    flag: Bool = false;
    val: Int as uint32 = 0;
}

struct Outer {
    innerOpt: Inner?;
    count: Int?;
    text: String = "test";
}

contract TestContract {
    field: Outer;
    init() {
        self.field = Outer{
            innerOpt: Inner{ flag: true, val: 123 },
            count: null,
            text: "hello",
        };
    }
}
