struct Sub {
    x: Int?;
    y: Int?;
}

struct Outer {
    a: Sub?;
    b: Sub?;
}

contract NullableNested {
    val: Outer?;
    init() {
        self.val = Outer{a:null,b:Sub{x:null,y:7}};
    }
}
