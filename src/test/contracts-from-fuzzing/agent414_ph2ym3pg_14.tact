struct OptStruct {
    a: Int; b: Int?; c: Bool?; d: String?;
}

contract OptStructField {
    container: OptStruct?;
    init() {
        self.container = null;
    }
}
