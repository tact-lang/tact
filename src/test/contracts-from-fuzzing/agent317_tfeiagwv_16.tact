struct TripleNested {
    a: Inner1;
    b: Inner2;
    c: Inner3;
}

struct Inner1 {
    val: Int;
}

struct Inner2 {
    val: Bool;
}

struct Inner3 {
    val: String;
}

contract ThreeNest {
    nested: TripleNested;

    init() {
        self.nested = TripleNested{
            a: Inner1{val: 5},
            b: Inner2{val: true},
            c: Inner3{val: "hello"}
        };
    }
}