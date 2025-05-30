struct AddrStruct {
    owner: Address;
    proxy: Address?;
    message: String;
}

contract TestContract {
    data: AddrStruct;

    init() {
        self.data = AddrStruct{
            owner: myAddress(),
            proxy: null,
            message: "hi there"
        };
    }
}