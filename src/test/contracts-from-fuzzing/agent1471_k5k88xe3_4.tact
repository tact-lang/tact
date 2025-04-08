struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
}

struct Wrapper {
    sa: StructA;
    sb: StructB;
}

contract DeepWrap {
    inner: Wrapper;

    init() {
        self.inner = Wrapper{
            sa: StructA{a: 1},
            sb: StructB{b: 2},
        };
    }
}