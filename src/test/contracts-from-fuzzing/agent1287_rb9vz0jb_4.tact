struct Deep1 { a: Int; }
struct Deep2 { b: Deep1; }
struct Deep3 { c: Deep2; }
struct Deep4 { d: Deep3; }

contract TestContract {
    data: Deep4;

    init() {
        self.data = Deep4{
            d: Deep3{
                c: Deep2{
                    b: Deep1{a:42},
                },
            },
        };
    }
}