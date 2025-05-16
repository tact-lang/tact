struct A { val: Int; }
struct B { val: Int; }

struct BigMix {
    a: A;
    b: B;
    i: Int;
    s: String;
    flag: Bool;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract BigMixTest {
    val: BigMix;

    init() {
        self.val = BigMix{
            a:A{val:1},
            b:B{val:2},
            i:3,
            s:"hello",
            flag:true,
            optInt:null,
            optStr:"hi",
            optBool:null
        };
    }
}