struct A {v: Int}
struct B {v: Int}
struct C {v: Int}
struct D {v: Int}
struct E {v: Int}
struct F {v: Int}
struct G {v: Int}
struct H {v: Int}
struct I {v: Int}
struct J {v: Int}
struct K {v: Int}
struct L {v: Int}
struct M {v: Int}
struct N {v: Int}

contract ManyStructs {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;
    f: F;
    g: G;
    h: H;
    i: I;
    j: J;
    k: K;
    l: L;
    m: M;
    n: N;

    init() {
        self.a=A{v:1};self.b=B{v:2};self.c=C{v:3};self.d=D{v:4};
        self.e=E{v:5};self.f=F{v:6};self.g=G{v:7};self.h=H{v:8};
        self.i=I{v:9};self.j=J{v:10};self.k=K{v:11};self.l=L{v:12};
        self.m=M{v:13};self.n=N{v:14};
    }
}