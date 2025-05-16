struct DeepNest2 {
    lvl1: DeepNest1;
}

struct DeepNest1 {
    lvl0: BaseNest;
}

struct BaseNest {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    nested: DeepNest2;

    init() {
        self.nested = DeepNest2{
            lvl1: DeepNest1{
                lvl0: BaseNest{
                    a:1,
                    b:true,
                    c:"hello",
                },
            },
        };
    }
}