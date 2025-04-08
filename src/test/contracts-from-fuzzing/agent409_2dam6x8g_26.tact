struct C1 { a: Int; b: Bool?; c: String; }
struct C2 { x: C1; y: C1?; }
struct C3 { u: C2; v: C2?; }
struct C4 { p: C3; q: C3?; }

contract SuperNested {
    s: C4;

    init() {
        self.s = C4{
            p: C3{
                u: C2{
                    x: C1{ a:1, b:null, c:"" },
                    y: null
                },
                v: null
            },
            q: null
        };
    }
}