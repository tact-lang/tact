struct OptInStruct {
    first: Int;
    second: String?;
}

contract MixOptStruct {
    data: OptInStruct;

    init() {
        self.data = OptInStruct{
            first: 7,
            second: null,
        };
    }
}