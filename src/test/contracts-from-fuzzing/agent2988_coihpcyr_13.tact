struct A { a: Int }
struct B { b: A }
struct C { c: B }
struct D { d: C }
struct E { e: D }
struct F { f: E }
struct G { g: F }
struct H { h: G }
struct I { i: H }

contract Deep10 {
    data: I;
    init() {
        self.data = I{ i:H{ h:G{ g:F{ f:E{ e:D{ d:C{ c:B{ b:A{a:1}}}}}}}}};
    }
}