struct BigNestA {
    aa: Int;
    ab: Int?;
}

struct BigNestB {
    ba: BigNestA;
    bb: BigNestA?;
}

struct BigNestC {
    ca: BigNestB?;
    cb: Int;
}

contract GiantNestedFields {
    root: BigNestC?;
    
    init() {
        self.root = BigNestC{
            ca: BigNestB{
                ba: BigNestA{ aa:1, ab:null },
                bb: null
            },
            cb: 42
        };
    }
}