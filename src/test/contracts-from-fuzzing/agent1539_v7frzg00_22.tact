struct MultipleNested {
    a: Int;
    b: Sub1;
    c: Sub2;
}

struct Sub1 {
    x: Int;
    y: Sub3;
}

struct Sub2 {
    p: Bool;
    q: Sub4;
}

struct Sub3 {
    z: Int;
}

struct Sub4 {
    w: String;
}

contract MultiBranch {
    data: MultipleNested;
    init() {
        self.data = MultipleNested{
            a:0,
            b: Sub1{x:1,y:Sub3{z:3}},
            c: Sub2{p:true,q:Sub4{w:"w"}}
        };
    }
}