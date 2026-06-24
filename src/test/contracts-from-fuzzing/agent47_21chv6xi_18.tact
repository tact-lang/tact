struct WrapInt {
    inner: Int;
}

struct Wrapper2 {
    nested: WrapInt;
}

contract WrapperPersist {
    v: Wrapper2;

    init() {
        self.v = Wrapper2{
            nested: WrapInt{ inner: -42 }
        };
    }
}