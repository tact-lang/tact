struct InnerWithDefaults {
    x: Int as uint8 = 9;
    y: Bool? = true;
    z: String? = null;
}

struct MiddleNested {
    val: InnerWithDefaults;
    info: String = "hi";
    amount: Int as int32;
}

contract NestedDefaults {
    data: MiddleNested;

    init() {
        self.data = MiddleNested{
            val: InnerWithDefaults{},
            info: "updated",
            amount: -1000
        };
    }
}