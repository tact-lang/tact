struct DefaultFieldStruct {
    x: Int = 10;
    y: String = "hi";
    z: Bool = false;
}

contract DefaultsInStruct {
    val: DefaultFieldStruct;

    init() {
        self.val = DefaultFieldStruct{};
    }
}