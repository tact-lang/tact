struct S1 {
    b: Bool;
}

struct S2 {
    i: Int;
}

struct S3 {
    s: String;
}

struct Combo {
    part1: S1;
    part2: S2;
    part3: S3;
}

contract NestedComposites {
    combo: Combo;

    init() {
        self.combo = Combo{
            part1: S1{b:true},
            part2: S2{i:42},
            part3: S3{s:"hi"},
        };
    }
}