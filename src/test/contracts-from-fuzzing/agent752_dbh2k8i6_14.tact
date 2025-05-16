struct OptStruct {
    f: Int?;
}

contract NullInit {
    data: OptStruct;

    init() {
        self.data = OptStruct{ f: null };
    }
}