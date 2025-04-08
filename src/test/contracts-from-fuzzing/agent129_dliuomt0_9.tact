// Struct with deeply nested optional struct inside optional struct
struct L3 {
    z: String;
}

struct L2 {
    l3: L3?;
}

struct L1 {
    l2: L2?;
}

contract DeepOptionals {
    nested: L1;

    init() {
        self.nested = L1{
            l2: null,
        };
    }
}
