struct OptStruct {
    a: Int?;
    b: Bool?;
}

contract TopOpt {
    inner: OptStruct;
    init() {
        self.inner = OptStruct{ a: null, b: null };
    }
}