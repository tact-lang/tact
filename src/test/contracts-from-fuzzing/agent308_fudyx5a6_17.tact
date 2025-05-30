struct BoolNest {
    flag: Bool;
    next: BoolLayer;
}

struct BoolLayer {
    flag: Bool;
    last: Bool;
}

contract DeepBools {
    nested: BoolNest;

    init() {
        self.nested = BoolNest{
            flag: false,
            next: BoolLayer{
                flag:true,
                last:false
            }
        };
    }
}
