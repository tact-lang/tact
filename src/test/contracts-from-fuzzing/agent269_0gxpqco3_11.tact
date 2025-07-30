struct InnerStruct {
    x: Int = 0;
    y: Int = 0;
}

contract DefaultVals {
    s: InnerStruct = InnerStruct{ x: 42, y: 43 };

    init() {
        self.s = InnerStruct{};
    }
}