struct Struct1 { a1: Int; a2: Bool; }
struct Struct2 { b1: Struct1; b2: Int; }
struct Struct3 { c1: Struct2; c2: Bool; }

contract ThreeDeep {
    deep: Struct3;

    init() {
        self.deep = Struct3{
            c1: Struct2{
                b1: Struct1{ a1: 1, a2: false },
                b2: 2
            },
            c2: true
        };
    }
}