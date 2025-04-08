struct Leaf1 { a: Int }
struct Leaf2 { b: String }
struct Leaf3 { c: Bool? }

struct Mid1 { l1: Leaf1; l2: Leaf2 }
struct Mid2 { l3: Leaf3; num: Int }

struct Top {
    m1: Mid1;
    m2: Mid2;
    flag: Bool;
}

contract BranchCombine {
    everything: Top;

    init() {
        self.everything = Top{
            m1: Mid1{
                l1: Leaf1{ a:1 },
                l2: Leaf2{ b:"x" }
            },
            m2: Mid2{
                l3: Leaf3{ c:null },
                num: 123
            },
            flag: true
        };
    }
}