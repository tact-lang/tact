struct StructA {
    x: Int;
}

struct StructB {
    a: StructA;
}

struct StructC {
    b: StructB;
}

struct BigContainer {
    one: StructC;
    two: StructC;
    three: StructC;
    four: StructC;
}

contract ManyNestedStructs {
    big: BigContainer;

    init() {
        self.big = BigContainer{
            one: StructC{ b: StructB{ a: StructA{ x: 1 } } },
            two: StructC{ b: StructB{ a: StructA{ x: 2 } } },
            three: StructC{ b: StructB{ a: StructA{ x:3 } } },
            four: StructC{ b: StructB{ a: StructA{ x:4 } } }
        };
    }
}