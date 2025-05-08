struct OptStruct {
    field1: Int?;
    field2: Bool?;
    field3: String?;
}

contract TestContract {
    s: OptStruct;

    init() {
        self.s = OptStruct{
            field1: null,
            field2: true,
            field3: null
        };
    }

    receive() {
        self.s = self.s; // trivial
    }
}