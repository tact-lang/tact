struct OptStruct {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract OptionalStructFields {
    data: OptStruct;

    init() {
        self.data = OptStruct{ x:null, y:null, z:null };
    }
}
