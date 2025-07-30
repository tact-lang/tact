struct Chain3 {
    l1: Int;
    l2: Bool;
    l3: String;
}

struct Container {
    c: Chain3;
    cOpt: Chain3?;
}

contract StructFieldMix {
    f: Container;

    init() {
        self.f = Container{
            c: Chain3{l1:7, l2:true, l3:"x"},
            cOpt: null,
        };
    }
}