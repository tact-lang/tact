struct OptStruct {
    a: Int;
    b: Int?;
    c: Bool?;
}

contract TestContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            a: 5,
            b: null,
            c: true,
        };
    }
}