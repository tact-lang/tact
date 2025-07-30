struct Inner {
    amount: Int;
    flag: Bool;
    info: String;
}

struct Outer {
    left: Inner;
    right: Inner;
}

contract ManyNested {
    contents: Outer;
    backup: Outer;

    init() {
        self.contents = Outer{
            left: Inner{amount:1, flag:true, info:"L1"},
            right: Inner{amount:2, flag:false, info:"R1"},
        };
        self.backup = Outer{
            left: Inner{amount:3, flag:false, info:"L2"},
            right: Inner{amount:4, flag:true, info:"R2"},
        };
    }
}