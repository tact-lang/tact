// Large nested struct chain with optional fields and strings
struct N1 { a: Int; b: String; }
struct N2 { c: N1; d: Bool; }
struct N3 { e: N2; f: Int?; }
struct N4 { g: N3; h: String?; }

contract TestContract {
    deep: N4;

    init() {
        self.deep = N4{
            g: N3{
                e: N2{c: N1{a:1,b:"x"}, d:true},
                f: null
            },
            h: "end"
        };
    }
}