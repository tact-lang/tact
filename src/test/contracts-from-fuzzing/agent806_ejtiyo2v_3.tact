struct DeepStruct {
    level: Int;
    inner: NestedInner;
}

struct NestedInner {
    flag: Bool;
    addr: Address;
}

contract TestContract {
    deepData: DeepStruct;
    init() {
        self.deepData = DeepStruct{
            level: 7,
            inner: NestedInner{
                flag: true,
                addr: myAddress()
            }
        };
    }
}