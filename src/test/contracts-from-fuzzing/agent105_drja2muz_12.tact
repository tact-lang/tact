struct S1 {
    foo: Int;
    opt: Int?;
}

struct S2 {
    bar: S1?;
    num: Int;
}

contract TestContract {
    field: S2?;

    init() {
        self.field = S2{
            bar: S1{foo:42,opt:null},
            num: 7
        };
    }

    receive() {}
}