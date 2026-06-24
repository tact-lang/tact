struct OptStr {
    value: String?;
}

contract OptInStruct {
    data: OptStr;

    init() {
        self.data = OptStr{ value: null };
    }
}