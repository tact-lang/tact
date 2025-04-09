struct DefaultValsStruct {
    x: Int = 10;
    y: String = "hello";
    z: Bool = true;
}

contract DefaultVals {
    s: DefaultValsStruct;

    init() {
        self.s = DefaultValsStruct{};
    }
}