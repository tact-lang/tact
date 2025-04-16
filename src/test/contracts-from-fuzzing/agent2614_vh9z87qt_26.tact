struct NestedStringOptionals {
    s1: String?;
    s2: String?;
}

struct ManyNestedOptions {
    n1: NestedStringOptionals?;
    n2: NestedStringOptionals?;
}

contract CompoundOptionStruct {
    data: ManyNestedOptions;

    init() {
        self.data = ManyNestedOptions{
            n1:null,
            n2:null
        };
    }
}