struct Sub1 { f1: Int; f2: Bool; }
struct Sub2 { s1: String; s2: String; }

contract ManyMix {
    a: Int;
    b: Bool;
    s: String;
    addr: Address;
    sub1: Sub1;
    sub2: Sub2;
    optI: Int?;
    optS: String?;

    init() {
        self.a = 10;
        self.b = true;
        self.s = "hello";
        self.addr = myAddress();
        self.sub1 = Sub1{ f1:1, f2:true };
        self.sub2 = Sub2{ s1:"x", s2:"y" };
        self.optI = null;
        self.optS = null;
    }
}