struct OptStruct {
    n: Int?;
    b: Bool?;
    addr: Address?;
    txt: String?;
}

contract OptContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            n: null,
            b: true,
            addr: null,
            txt: "hello"
        };
    }
}