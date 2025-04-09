struct BoolNest {
    b1: Bool;
    b2: Bool?;
    b3: Bool;
    b4: Bool?;
}

struct Container {
    nest: BoolNest;
    flag: Bool;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            nest: BoolNest{b1:true,b2:null,b3:false,b4:true},
            flag: true,
        };
    }
}