struct OptStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Slice?;
    f: Cell?;
}

contract TestContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}