struct OptStruct {
    opt: Inner?;
}

struct Inner {
    i: Int;
    b: Bool;
    addr: Address;
}

contract TestContract {
    st: OptStruct;
    init() {
        self.st = OptStruct{
            opt: null,
        };
    }
}