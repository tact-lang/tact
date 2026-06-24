struct SOptInStruct {
    f: Int?;
}

contract Test {
    data: SOptInStruct;

    init() {
        self.data = SOptInStruct{ f: null };
    }
}