struct Deep1 { f1: Int; f2: Int?; }
struct Deep2 { f3: Deep1; f4: Bool; }
struct Deep3 { f5: Deep2; f6: Int; }

contract TestStorage {
    val: Deep3;

    init() {
        self.val = Deep3{
            f5: Deep2{
                f3: Deep1{ f1: 1, f2: null },
                f4: false
            },
            f6: 0
        };
    }
}
