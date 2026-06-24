struct DeepNest4 {
    a: Int;
    b: Int?;
    c: String?;
}

struct DeepNest3 {
    nest: DeepNest4;
    value: Int?;
}

struct DeepNest2 {
    nest: DeepNest3;
    val: String?;
}

struct DeepNest1 {
    nest: DeepNest2;
    flag: Bool?;
}

contract DeepFuzz {
    complex: DeepNest1;
    
    init() {
        self.complex = DeepNest1{
            nest: DeepNest2{
                nest: DeepNest3{
                    nest: DeepNest4{
                        a: 1,
                        b: null,
                        c: null,
                    },
                    value: null,
                },
                val: null,
            },
            flag: null,
        };
    }
}