struct NN { 
    a: Int; 
    b: Int; 
}

struct ON {
    a: Int?;
    b: Int;
}

struct NO {
    a: Int;
    b: Int?;
}

struct OO {
    a: Int?;
    b: Int?;
}

struct Container {
    nn: NN;
    on: ON;
    no: NO;
    oo: OO;
}

contract MixOpt {
    val: Container;

    init() {
        self.val = Container{
            nn: NN{a:1,b:2},
            on: ON{a:null,b:3},
            no: NO{a:4,b:null},
            oo: OO{a:null,b:null}
        };
    }
}
