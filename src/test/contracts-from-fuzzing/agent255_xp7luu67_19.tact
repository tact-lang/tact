// nested struct with nested optionals
struct Inner {
    flag: Bool?;
    count: Int?;
}

struct Outer {
    innerOpt: Inner?;
}

contract TestContract {
    param: Outer;

    init() {
        self.param = Outer{
            innerOpt: Inner{flag:null, count: null}
        };
    }
}