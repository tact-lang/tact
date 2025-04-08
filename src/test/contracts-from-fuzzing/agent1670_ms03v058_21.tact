struct VeryDeep {
    i: Deep4;
}

struct Deep4 {
    i: Deep3;
}

struct Deep3 {
    i: Deep2;
}

struct Deep2 {
    i: Deep1;
}

struct Deep1 {
    a: Int;
}

contract TestVeryDeep {
    v: VeryDeep;
    init() {
        self.v = VeryDeep{
            i: Deep4{ i: Deep3{i:Deep2{i:Deep1{a:42}}}}
        };
    }
}
