struct BoolNest {
    a: Bool;
    b: Bool?;
}

struct NestLevel {
    x: BoolNest;
    y: BoolNest?;
}

contract TestContract {
    data: NestLevel;

    init() {
        self.data = NestLevel{
            x: BoolNest{a:true, b:null},
            y: null
        };
    }
}