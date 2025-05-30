// multiple nested structs with optional fields and defaults
struct S1 {
    val: Int = 7;
}

struct S2 {
    s1: S1?;
    flag: Bool = false;
}

contract ComplexOptInit {
    data: S2?;

    init() {
        self.data = S2{
            s1: S1{},
            flag: true
        };
    }
}