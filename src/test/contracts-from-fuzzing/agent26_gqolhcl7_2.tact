struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    nestedOpt: OptStruct;

    init() {
        self.nestedOpt = OptStruct{
            a: null,
            b: true,
            c: "abc"
        };
    }
}
