struct StrucA { a: Int; }
struct StrucB { b: Int; }
struct StrucC { c: Int; }

struct HugeNest {
    sa: StrucA?;
    sb: StrucB?;
    sc: StrucC?;
    sa2: StrucA?;
    sb2: StrucB?;
    sc2: StrucC?;
}

contract ManyOptionalStructs {
    comp: HugeNest;

    init() {
        self.comp = HugeNest{
            sa: StrucA{a:1},
            sb: null,
            sc: StrucC{c:3},
            sa2: null,
            sb2: StrucB{b:5},
            sc2: null
        };
    }
}