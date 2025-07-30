struct OptStruct {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract TestContract {
    o: OptStruct;

    init() {
        self.o = OptStruct{
            s: null,
            b: null,
            i: null,
        };
    }
}
