struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            a: null,
            b: true,
            c: null
        };
    }
}