struct Inner {
    foo: Int;
    flag: Bool?;
}

struct Outer {
    id: Int;
    name: String?;
    sub: Inner;
    addr: Address?;
}

contract ComplexMixed {
    val: Outer;
    init() {
        self.val = Outer{id:1,name:null,sub:Inner{foo:5,flag:true},addr:null};
    }
}