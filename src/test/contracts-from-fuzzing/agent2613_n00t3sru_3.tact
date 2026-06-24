struct Deep1 { val: Int; }
struct Deep2 { nest: Deep1; }
struct Deep3 { nest: Deep2; }
struct Deep4 { nest: Deep3; }

contract DeepNest {
    f: Deep4;

    init() {
        self.f = Deep4{
            nest: Deep3{
                nest: Deep2{
                    nest: Deep1{ val: 7 },
                },
            },
        };
    }
}