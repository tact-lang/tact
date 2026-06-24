struct OptAddrStr {
    address: Address?;
    string: String?;
}

contract StorageTest {
    data: OptAddrStr;

    init() {
        self.data = OptAddrStr{
            address: null,
            string: "hi"
        };
    }
}