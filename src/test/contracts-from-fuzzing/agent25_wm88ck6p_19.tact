struct BigNested {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    x: Int;
    y: Bool;
}

struct Inner2 {
    z: String;
    w: Bool?;
}

contract TestContract {
    big: BigNested;

    init() {
        self.big = BigNested{
            a: 1,
            b: Inner1{ x:2, y:true },
            c: Inner2{ z:"qq", w:null },
        };
    }
}