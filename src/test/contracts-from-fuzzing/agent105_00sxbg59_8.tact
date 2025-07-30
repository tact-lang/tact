struct Deep1 { f1: Int; }
struct Deep2 { nested: Deep1; f2: Bool; }
struct Deep3 { nested: Deep2; opt: Bool?; }
struct Deep4 { nested: Deep3; f3: Int; }
contract DeepNest {
    val: Deep4;

    init() {
        self.val = Deep4{
            nested: Deep3{
                nested: Deep2{
                    nested: Deep1{ f1: 1 },
                    f2: true,
                },
                opt: false,
            },
            f3: 123,
        };
    }
}