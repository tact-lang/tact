struct OptStruct {
    a: Int?;
    b: Bool?;
    c: Cell?;
}

contract TestContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            a: null,
            b: null,
            c: null
        };
    }
}