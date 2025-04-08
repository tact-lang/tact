struct SS1 {
    f1: Int;
    f2: Int?;
}
struct SS2 {
    k1: Bool?;
    k2: String;
}
struct SS3 {
    nested1: SS1;
    nested2: SS2;
}

contract Coolio {
    field: SS3;
    init() {
        self.field = SS3{
            nested1: SS1{ f1: 10, f2: null },
            nested2: SS2{ k1: true, k2: "hooray" }
        };
    }
}
