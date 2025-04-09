struct MultiLevel {
    a: Int = 1;
    b: Bool = false;
    c: String = "ok";
    d: InnerStruct = InnerStruct{ z:42 };
}

struct InnerStruct {
    z: Int;
}

contract DefaultsHolder {
    ml: MultiLevel;
    init() {
        self.ml = MultiLevel{};
    }
}