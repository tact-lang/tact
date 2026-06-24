struct Compose {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    s1: S1?;
}

struct S1 {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: Compose;

    init() {
        self.data = Compose{
            optInt:null, optBool:null, optAddr:null, s1:null
        };
    }
}