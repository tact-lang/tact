struct X {
    a: Int;
    b: Bool;
}

struct Y {
    one: X;
    two: X;
    three: X;
}

struct Z {
    y1: Y;
    y2: Y;
}

contract NestedWide {
    z: Z = Z{
        y1: Y{ one:X{a:1,b:true}, two:X{a:2,b:false}, three:X{a:3,b:true}},
        y2: Y{ one:X{a:4,b:false}, two:X{a:5,b:true}, three:X{a:6,b:false}}
    };

    receive() {
        let sum = self.z.y1.one.a + self.z.y1.two.a + self.z.y1.three.a + self.z.y2.one.a + self.z.y2.two.a + self.z.y2.three.a;
    }
}