struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Outer {
    inner: NestedOptional;
    z: Int;
}

contract OptionalInside {
    st: Outer;
    init() {
        self.st = Outer{inner: NestedOptional{a:null,b:null,c:null}, z: 77};
    }
}
