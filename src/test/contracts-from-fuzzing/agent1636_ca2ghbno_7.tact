struct OptStruct {
    n: Int?;
    s: String?;
    b: Bool?;
    a: Address?;
}

contract TestContract {
    opt: OptStruct;

    init() {
        self.opt = OptStruct{
            n: null,
            s: null,
            b: true,
            a: myAddress()
        };
    }
}