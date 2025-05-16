struct MultiLevel {
    d: Int;
    o: Int?;
}

struct Level2 {
    a: MultiLevel;
    b: Bool;
}

contract NestedOptionalDeep {
    opt: Level2;

    init() {
        self.opt = Level2{a: MultiLevel{d:5, o:null}, b:true};
    }
}