struct N1 { v: Int }
struct N2 { a: N1; b: N1 }
struct N3 { x: N2; y: N2 }
struct N4 { p: N3; q: N3 }
contract Deep4Nested {
    root: N4;

    init() {
        self.root = N4{
            p: N3{
                x: N2{ a:N1{v:1}, b:N1{v:2} },
                y: N2{ a:N1{v:3}, b:N1{v:4} }
            },
            q: N3{
                x: N2{ a:N1{v:5}, b:N1{v:6} },
                y: N2{ a:N1{v:7}, b:N1{v:8} }
            }
        };
    }
}