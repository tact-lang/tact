struct Deep1 { f1: Int; f2: Int?; }
struct Deep2 { f3: Deep1; f4: Bool; }
struct Deep3 { f5: Deep2; f6: Int; }

contract RepeatLast {
    storage1: Deep3;
    storage2: Deep3;

    init() {
        let s = Deep3{
            f5: Deep2{
                f3: Deep1{ f1: 1, f2: null },
                f4: false
            },
            f6: 0
        };
        self.storage1 = s;
        self.storage2 = s;
    }
}
