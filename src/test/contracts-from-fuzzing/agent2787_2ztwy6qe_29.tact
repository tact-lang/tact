struct Leaf { i: Int }

contract ReallyWide {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    f11: Int;
    f12: Int;
    f13: Int;
    f14: Int;
    f15: Int;
    s1: Leaf;
    s2: Leaf;
    s3: Leaf;
    s4: Leaf;
    s5: Leaf;

    init() {
        self.f1=1;self.f2=2;self.f3=3;self.f4=4;self.f5=5;
        self.f6=6;self.f7=7;self.f8=8;self.f9=9;self.f10=10;
        self.f11=11;self.f12=12;self.f13=13;self.f14=14;self.f15=15;
        self.s1=Leaf{i:1};self.s2=Leaf{i:2};self.s3=Leaf{i:3};self.s4=Leaf{i:4};self.s5=Leaf{i:5};
    }
}
