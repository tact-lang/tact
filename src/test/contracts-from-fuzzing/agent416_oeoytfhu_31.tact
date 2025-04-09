struct AA { a: Int }
struct BB { b: Int }
struct CC { c: Int }

struct NestedAB {
    aa: AA;
    bb: BB;
}

struct Container {
    ab: NestedAB;
    cc: CC;
}

contract Test31 {
    field: Container;

    init() {
        self.field = Container{
            ab: NestedAB{
                aa: AA{ a: 11 },
                bb: BB{ b: 22 }
            },
            cc: CC{ c: 33 }
        };
    }
}
