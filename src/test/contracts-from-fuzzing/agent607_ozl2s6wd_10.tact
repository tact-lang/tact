struct MyStruct {
    n: Int as int64;
    flag: Bool;
    addr: Address;
}

contract OptionalStructStorage {
    data: MyStruct?;
    init() {
        self.data = null;
    }
}