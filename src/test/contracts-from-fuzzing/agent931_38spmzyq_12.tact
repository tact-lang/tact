struct X { f1: Int?; f2: Bool?; }

struct Y { x1: X; x2: X; }

struct Z { y1: Y; y2: Y; }

contract ManyNestedOptionals {
    z: Z;

    init() {
        self.z = Z{
            y1: Y{ x1: X{f1:null,f2:null}, x2: X{f1:null,f2:null}},
            y2: Y{ x1: X{f1:null,f2:null}, x2: X{f1:null,f2:null}}
        };
    }
}