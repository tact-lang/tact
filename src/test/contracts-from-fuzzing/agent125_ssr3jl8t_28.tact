struct OptStruct {
    x: Int?;
    y: Bool?;
}

contract OptStructField {
    data: OptStruct?;

    init() {
        self.data = null;
    }
}