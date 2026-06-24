struct InnerData {
    count: Int;
    flag: Bool;
    label: String;
    addr: Address;
}

contract StructInContract {
    data: InnerData;

    init() {
        self.data = InnerData{
            count: 42,
            flag: true,
            label: "hello",
            addr: myAddress(),
        };
    }
}