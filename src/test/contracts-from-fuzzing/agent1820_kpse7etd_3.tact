struct Inner {
    val: Int;
    flag: Bool;
}

struct Outer {
    innerStruct: Inner;
    addr: Address;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            innerStruct: Inner{
                val: 123,
                flag: true,
            },
            addr: myAddress(),
        };
    }
}