struct ManyNesting {
    i1: Int;
    nest1: Nest;
    nest2: Nest;
}

struct Nest {
    f1: Int;
    f2: Bool;
    f3: String;
}

contract ManyDeepNests {
    val: ManyNesting;
    init() {
        self.val = ManyNesting{
            i1:1,
            nest1: Nest{f1:2,f2:true,f3:"a"},
            nest2: Nest{f1:3,f2:false,f3:"b"}
        };
    }
}