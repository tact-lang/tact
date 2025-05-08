struct InnerDefaults {
    val: Int = 5;
    enabled: Bool = true;
}

struct OuterDefaults {
    inner: InnerDefaults;
    comment: String = "hello";
}

contract DefaultedStructs {
    data: OuterDefaults;

    init() {
        self.data = OuterDefaults{
            inner: InnerDefaults{},
            comment: "set",
        };
    }
}
