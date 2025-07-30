struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }
struct D { d: Int; }
struct E { e: Int; }
struct F { f: Int; }
struct G { g: Int; }
struct H { h: Int; }
struct I { i: Int; }
struct J { j: Int; }

contract TestContract {
    fa: A;
    fb: B;
    fc: C;
    fd: D;
    fe: E;
    ff: F;
    fg: G;
    fh: H;
    fi: I;
    fj: J;

    init() {
        self.fa=A{a:1};self.fb=B{b:2};self.fc=C{c:3};self.fd=D{d:4};self.fe=E{e:5};
        self.ff=F{f:6};self.fg=G{g:7};self.fh=H{h:8};self.fi=I{i:9};self.fj=J{j:10};
    }
}