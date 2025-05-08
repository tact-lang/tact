struct Fungus {
    in1: Int;
    in2: Int?;
    in3: String;
}

struct Amongus {
    sub: Fungus;
    subOpt: Fungus?;
}

contract ComplexMixedOptional {
    data: Amongus;

    init() {
        self.data = Amongus{
            sub: Fungus{ in1:1, in2:null, in3:"a" },
            subOpt: null
        };
    }
}