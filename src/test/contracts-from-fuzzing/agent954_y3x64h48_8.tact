struct InnerMost1 { a: Int; }
struct InnerMost2 { b: Bool; }
struct InnerMost3 { c: String; }

struct MidLayer1 { im1: InnerMost1; val: Int; }
struct MidLayer2 { im2: InnerMost2; flag: Bool; }
struct MidLayer3 { im3: InnerMost3; text: String; }

struct TopLevel {
    m1: MidLayer1;
    m2: MidLayer2;
    m3: MidLayer3;
}

contract MultiBranchNested {
    nested: TopLevel = TopLevel{
        m1: MidLayer1{im1: InnerMost1{a:1}, val:2},
        m2: MidLayer2{im2: InnerMost2{b:true}, flag:false},
        m3: MidLayer3{im3: InnerMost3{c:"txt"}, text: "str"}
    };

    init() {}
}