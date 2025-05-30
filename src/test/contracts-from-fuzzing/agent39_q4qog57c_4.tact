struct OptStruct {
    x: Int?;
    y: Bool?;
    addr: Address?;
}

contract TestContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            x: null,
            y: true,
            addr: null,
        };
    }
}