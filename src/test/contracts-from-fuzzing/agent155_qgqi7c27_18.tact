struct OptInStruct {
    n: Int?;
    b: Bool?;
    s: String?;
}
contract OptionalStorage {
    data: OptInStruct;
    init() {
        self.data = OptInStruct{n: null, b: null, s: null};
    }
}