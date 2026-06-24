struct S1 { x: Int }
struct S2 { x: Int }
struct S3 { x: Int }
struct S4 { x: Int }
struct S5 { x: Int }
struct S6 { x: Int }
struct S7 { x: Int }
struct S8 { x: Int }
struct S9 { x: Int }
struct S10 { x: Int }

struct BigNest {
    a: S1;
    b: S2;
    c: S3;
    d: S4;
    e: S5;
    f: S6;
    g: S7;
    h: S8;
    i: S9;
    j: S10;
}

contract WideNested {
    store: BigNest;

    init() {
        self.store = BigNest{
            a:S1{x:1}, b:S2{x:2}, c:S3{x:3}, d:S4{x:4}, e:S5{x:5},
            f:S6{x:6}, g:S7{x:7}, h:S8{x:8}, i:S9{x:9}, j:S10{x:10}
        };
    }
}