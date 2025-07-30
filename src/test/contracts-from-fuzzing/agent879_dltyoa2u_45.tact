struct TypeMix {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
}

contract TypeMixTest {
    s: TypeMix;
    init() {
        self.s = TypeMix{ a:1, b:true, c:null, d:null, e:5 };
    }
}
