struct Deep1 { a: Int; b: Bool; }
struct Deep2 { a: Deep1; b: Bool; }
struct Deep3 { a: Deep2; b: Int; }
struct Deep4 { a: Deep3; b: String; }

contract MultiNest {
    f: Deep4;
    init() {
        self.f = Deep4{
            a: Deep3{
                a: Deep2{
                    a: Deep1{
                        a: 1,
                        b: true
                    },
                    b: false
                },
                b: 2
            },
            b: "hello"
        };
    }
}