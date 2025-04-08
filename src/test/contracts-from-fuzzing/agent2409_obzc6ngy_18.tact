struct S_Level4 { val: Int; }
struct S_Level3 { s: S_Level4; }
struct S_Level2 { s: S_Level3; }
struct S_Level1 { s: S_Level2; }

contract LongChainNested {
    f: S_Level1;

    init() {
        self.f = S_Level1{ s: S_Level2{ s: S_Level3{ s: S_Level4{ val: 777 } } } };
    }
}