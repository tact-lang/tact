struct SA { a: Int; }
struct SB { b: Int; }
struct SC { c: Bool; }
contract StructMix {
    s1: SA;
    s2: SB;
    s3: SC;
    init() {
        self.s1=SA{a:1};
        self.s2=SB{b:2};
        self.s3=SC{c:true};
    }
}