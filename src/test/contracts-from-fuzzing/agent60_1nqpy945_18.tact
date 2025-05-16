struct OptStruct1 {
    a: Int?;
}

struct OptStruct2 {
    b: Bool?;
    inner: OptStruct1?;
}

struct OptStruct3 {
    c: String?;
    inner: OptStruct2?;
}

contract TestContract {
    nestedOpt: OptStruct3;

    init() {
        self.nestedOpt = OptStruct3{
            c: null,
            inner: null
        };
    }
}