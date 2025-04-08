struct LargeNested1 { f1: Int; f2: Int; f3: Int; }
struct LargeNested2 { n1: LargeNested1; n2: LargeNested1; }

contract WideNested {
    big: LargeNested2;

    init() {
        self.big = LargeNested2 {
            n1: LargeNested1 { f1:1, f2:2, f3:3 },
            n2: LargeNested1 { f1:4, f2:5, f3:6 }
        };
    }
}