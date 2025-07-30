// Nested optional structs, some fields null, mixing types
struct L3 {
    v: Int;
    text: String?;
}

struct L2 {
    l3: L3?;
    flag: Bool?;
}

struct L1 {
    l2: L2?;
}

contract DeepOptMix {
    data: L1?;

    init() {
        self.data = L1{
            l2: L2{
                l3: null,
                flag: true
            }
        };
    }
}