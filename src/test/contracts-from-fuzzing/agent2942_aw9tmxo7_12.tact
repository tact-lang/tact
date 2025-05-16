struct StructA { one: Int }
struct StructB { two: Int }
struct StructC { three: Int }

struct Container {
    a: StructA;
    b: StructB;
    c: StructC;
}

contract ManyStructsNested {
    storage: Container;
    init() {
        self.storage = Container{
            a: StructA{ one: 1 },
            b: StructB{ two: 2 },
            c: StructC{ three: 3 },
        };
    }
}