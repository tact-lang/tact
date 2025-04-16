// minimal contract with nested struct using serialization annotations
struct Inner {
    smallInt: Int as int8;
    flag: Bool;
}

struct Outer {
    num: Int as uint16;
    inner: Inner;
}

contract TestContract {
    state: Outer;
    init() {
        self.state = Outer{num: 42, inner: Inner{smallInt:-4, flag:true}};
    }
}