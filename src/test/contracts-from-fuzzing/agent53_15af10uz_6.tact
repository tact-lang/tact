struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract Test6 {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{ x: null, y: null, z: null };
    }
    receive() {}
}