struct DeepNesting1 {
    f: Int;
}

struct DeepNesting2 {
    g: DeepNesting1;
}

struct DeepNesting3 {
    h: DeepNesting2;
}

struct DeepNesting4 {
    i: DeepNesting3;
}

struct DeepNesting5 {
    j: DeepNesting4;
}

contract VeryDeep {
    data: DeepNesting5;

    init() {
        self.data = DeepNesting5{
            j: DeepNesting4{
                i: DeepNesting3{
                    h: DeepNesting2{
                        g: DeepNesting1{
                            f: 123,
                        },
                    },
                },
            },
        };
    }
}