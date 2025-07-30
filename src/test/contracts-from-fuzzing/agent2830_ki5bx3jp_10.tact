struct Sub {
    x: Int;
    y: Int?;
    flag: Bool;
}

struct Root {
    one: Sub;
    two: Sub;
    three: Sub;
}

contract TripleStruct {
    store: Root;
    init() {
        self.store = Root{
            one: Sub{x:1,y:null,flag:true},
            two: Sub{x:2,y:3,flag:false},
            three: Sub{x:3,y:null,flag:true}
        };
    }
}