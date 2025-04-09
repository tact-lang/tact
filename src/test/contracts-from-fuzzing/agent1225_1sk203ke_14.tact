struct Small1 { f: Int }
struct Small2 { g: Int }
struct Small3 { h: Int }
struct Small4 { i: Int }

struct BigCompose {
    a: Small1;
    b: Small2;
    c: Small3;
    d: Small4;
}

contract ManySmallStructs {
    val: BigCompose;

    init() {
        self.val = BigCompose{
            a: Small1{f:1},
            b: Small2{g:2},
            c: Small3{h:3},
            d: Small4{i:4}
        };
    }
}