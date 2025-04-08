struct Inner1 {
    a: Int;
    b: Bool?;
}

struct Inner2 {
    x: Int?;
    y: Bool;
}

struct Middle {
    first: Inner1?;
    second: Inner2;
}

contract StructOptionMix {
    mid: Middle;

    init() {
        self.mid = Middle{
            first: null,
            second: Inner2{x:null, y:true},
        };
    }
}
