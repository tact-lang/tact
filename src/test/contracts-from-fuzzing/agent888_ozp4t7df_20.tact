struct Deep1 { a: Int; }
struct Deep2 { prev: Deep1; }
struct Deep3 { prev: Deep2; }
struct Deep4 { prev: Deep3; }
struct Deep5 { prev: Deep4; }

contract VeryDeep {
    d: Deep5;

    init() {
        self.d = Deep5{
            prev: Deep4{
                prev: Deep3{
                    prev: Deep2{
                        prev: Deep1{a:42},
                    },
                },
            },
        };
    }
}