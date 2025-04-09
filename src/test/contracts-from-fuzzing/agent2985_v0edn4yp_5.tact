struct DeepNest3 {
    lvl3val: Int;
}

struct DeepNest2 {
    lvl2val: Bool;
    next: DeepNest3;
}

struct DeepNest1 {
    lvl1val: String;
    next: DeepNest2;
}

contract DeepNestedStructs {
    deep: DeepNest1;
    
    init() {
        self.deep = DeepNest1{
            lvl1val: "deep",
            next: DeepNest2{
                lvl2val: true,
                next: DeepNest3{ lvl3val: 99 }
            }
        };
    }
}
