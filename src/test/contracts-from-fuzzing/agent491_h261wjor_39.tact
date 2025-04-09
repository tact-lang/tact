// many nested structs with trailing comma during init
struct M1 { value1: Int; }
struct M2 { m1: M1; }
struct M3 { m2: M2; }
struct M4 { m3: M3; }

contract NestedTrailingComma {
    data: M4;
    init() {
        self.data = M4{
            m3: M3{
                m2: M2{
                    m1: M1{
                        value1: 11,
                    },
                },
            },
        };
    }
}