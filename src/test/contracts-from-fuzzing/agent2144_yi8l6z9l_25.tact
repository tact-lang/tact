struct Struct1 { x: Int }
struct Struct2 { y: Int }
struct Struct3 { z: Int }
struct Combo {
    s1: Struct1;
    s2: Struct2;
    s3: Struct3;
}

contract CombinedStructs {
    combo: Combo;

    init() {
        self.combo = Combo{
            s1: Struct1{ x: 1 },
            s2: Struct2{ y: 2 },
            s3: Struct3{ z: 3 }
        };
    }
}
