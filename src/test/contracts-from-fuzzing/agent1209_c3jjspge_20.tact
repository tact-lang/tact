struct DoubleNested {
    f1: Inner1;
    f2: Inner2;
}

struct Inner1 {
    x: Int;
    y: Int;
}

struct Inner2 {
    z: Int;
    w: Bool;
}

contract DoubleNestTest {
    data: DoubleNested;

    init() {
        self.data = DoubleNested{
            f1: Inner1{x:1,y:2},
            f2: Inner2{z:3,w:true}
        };
    }
}
