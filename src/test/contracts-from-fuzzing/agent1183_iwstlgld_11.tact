struct DefaultsNested {
    x: Int = 0;
    y: String = "nested";
    z: Bool;
}

contract DefaultsInStruct {
    data: DefaultsNested;

    init() {
        self.data = DefaultsNested{
            z: true,
        };
    }
}