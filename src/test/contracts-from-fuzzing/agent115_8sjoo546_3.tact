struct Deep1 { f1: Int; f2: Int?; }
struct Deep2 { d1: Deep1; opt: Deep1?; }
struct Deep3 { d2: Deep2; flag: Bool; opt2: Deep2?; }

contract Test {
    s: Deep3;

    init() {
        self.s = Deep3{
            d2: Deep2{
                d1: Deep1{f1: 1, f2: null},
                opt: null
            },
            flag: true,
            opt2: null
        };
    }
}