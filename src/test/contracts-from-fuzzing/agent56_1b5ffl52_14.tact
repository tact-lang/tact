struct SDefaulted {
    x: Int = 5;
    y: Bool = true;
    z: Int?; // default null
}

contract DefaultsInStruct {
    data: SDefaulted;

    init() {
        self.data = SDefaulted{
            x: 10,
            y: false,
            z: null,
        };
    }
}