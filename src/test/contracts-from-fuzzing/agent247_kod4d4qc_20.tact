struct Compose {
    id: Int;
    enabled: Bool;
    text: String;
    addr: Address;
    flag: Bool?;
    count: Int?;
}

contract CompTest {
    data: Compose;
    init() {
        self.data = Compose{
            id: 9,
            enabled: true,
            text: "txt",
            addr: myAddress(),
            flag: null,
            count: 42,
        };
    }
}