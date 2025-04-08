struct InnerDefaults {
    x: Int = 1;
    y: Bool? = null;
}

struct MiddleDefaults {
    inr: InnerDefaults;
    s: String = "hello";
    z: Int? = null;
}

contract TestNestedDefaults {
    data: MiddleDefaults = MiddleDefaults{
        inr: InnerDefaults{},
        s: "world",
        z: null
    };

    init() {}
}