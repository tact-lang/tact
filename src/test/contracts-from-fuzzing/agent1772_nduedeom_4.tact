struct OptNested {
    inner: Int?;
}

contract OptInStruct {
    data: OptNested;

    init() {
        self.data = OptNested{ inner: null };
    }
}