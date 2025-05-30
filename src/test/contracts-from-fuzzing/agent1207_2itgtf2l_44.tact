struct A {v: Int}
struct B {v: A}
struct C {v: B}
struct D {v: C}
struct E {v: D}
struct F {v: E}
struct G {v: F}
struct H {v: G}
struct I {v: H}
struct J {v: I}

contract Nest10 {
    x: J;

    init() {
        self.x = J{v:I{v:H{v:G{v:F{v:E{v:D{v:C{v:B{v:A{v:1}}}}}}}}}};
    }
}