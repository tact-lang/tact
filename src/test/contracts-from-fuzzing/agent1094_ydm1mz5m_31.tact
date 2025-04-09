struct N0 { a: Int; }
struct N1 { n: N0; }
struct N2 { n: N1; }
struct N3 { n: N2; }
struct N4 { n: N3; }
struct N5 { n: N4; }
contract Chain6 {
    foo: N5;
    init() { self.foo = N5{n:N4{n:N3{n:N2{n:N1{n:N0{a:1}}}}}}; }
}