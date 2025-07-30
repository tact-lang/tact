struct Child { x: Int; y: String; z: Bool; }

struct Parent {
    c1: Child;
    c2: Child;
    c3: Child;
}

contract ManyStructs {
    big: Parent;

    init() {
        self.big = Parent{
            c1: Child{ x:1,y:"a",z:true },
            c2: Child{ x:2,y:"b",z:false },
            c3: Child{ x:3,y:"c",z:true }
        };
    }
}