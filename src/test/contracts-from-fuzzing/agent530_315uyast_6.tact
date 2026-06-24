struct Sub { v1: Int; v2: Int; }
struct Super1 { sub1: Sub; sub2: Sub; }
struct Super2 { super1: Super1; x: Int; }

contract NestedSameType {
    s: Super2;

    init() {
        self.s = Super2{
            super1: Super1{
                sub1: Sub{ v1: 1, v2: 2 },
                sub2: Sub{ v1: 3, v2: 4 }
            },
            x: 5
        };
    }
}