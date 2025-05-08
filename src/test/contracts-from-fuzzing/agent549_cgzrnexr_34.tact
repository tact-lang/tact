struct RecOpt {
    a: Int?;
    b: Bool?;
}

struct Bigger {
    one: RecOpt;
    two: RecOpt;
    flag: Bool;
    count: Int;
}

contract DoubleOpt {
    storage: Bigger;

    init() {
        self.storage = Bigger{
            one: RecOpt{a:null,b:null},
            two: RecOpt{a:null,b:null},
            flag: false,
            count: 0,
        };
    }

    receive() {
        self.storage = Bigger{
            one: RecOpt{a:1,b:true},
            two: RecOpt{a:2,b:false},
            flag: true,
            count: 100,
        };
    }
}