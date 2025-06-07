struct SSub1 { a: Int; b: Bool; }
struct SSub2 { c: Int; d: Bool; }
struct SSub3 { e: Int; f: Bool; }

struct Combo {
    sub1: SSub1;
    sub2: SSub2;
    sub3: SSub3;
    n: Int?;
}

contract ComposedNested {
    data: Combo;

    init() {
        self.data = Combo{
            sub1: SSub1{ a: 1, b: true },
            sub2: SSub2{ c: 2, d: false },
            sub3: SSub3{ e:3, f:true },
            n: null
        };
    }
}
