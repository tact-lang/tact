struct S1 { a: Int; }
struct S2 { b: S1; }
struct S3 { c: S2; }
struct S4 { d: S3; }
struct S5 { e: S4; }
struct S6 { f: S5; }
struct S7 { g: S6; }
struct S8 { h: S7; }
struct S9 { i: S8; }

contract DeepChain {
    field: S9 = S9{
        i: S8{ h: S7{ g: S6{ f: S5{ e: S4{ d: S3{ c: S2{ b: S1{ a: 100 } } } } } } } }
    };

    receive() {
        let _ = self.field.i.h.g.f.e.d.c.b.a;
    }
}