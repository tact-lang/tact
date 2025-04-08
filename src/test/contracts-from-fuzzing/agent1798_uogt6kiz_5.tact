struct DeepNest2 {
    val: Int;
}

struct DeepNest1 {
    inner: DeepNest2;
}

struct RootStruct {
    nested: DeepNest1;
}

contract DeeplyNested {
    dat: RootStruct;
    init() {
        self.dat = RootStruct{
            nested: DeepNest1{
                inner: DeepNest2{ val: 11 }
            }
        };
    }
}