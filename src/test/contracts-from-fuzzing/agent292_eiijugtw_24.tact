struct Outer {
    a: Int?;
    inner: Inner;
}

struct Inner {
    b: Int;
}

contract OptionalBeforeStruct {
    data: Outer;

    init() {
        self.data = Outer{a:null, inner:Inner{b:5}};
    }
}