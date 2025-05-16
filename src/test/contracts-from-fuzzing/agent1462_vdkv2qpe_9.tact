struct Complex {
    i1: Int; 
    optB: Bool?;
    str: String;
}

struct Wrapper {
    inner: Complex;
    flag: Bool;
    optInt: Int?;
}

contract StoreIt {
    field: Wrapper;

    init() {
        self.field = Wrapper{
            inner: Complex{ i1: 100, optB: null, str: "hi" },
            flag: false,
            optInt: null
        };
    }
}