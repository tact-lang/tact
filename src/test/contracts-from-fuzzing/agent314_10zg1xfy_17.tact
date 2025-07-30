struct OptStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructDirect {
    a: OptStruct?;
    init() {
        self.a = null;
    }
}