struct LeafA { a: Int; }
struct MiddleA { leaf: LeafA; }

struct LeafB { b: Bool; }
struct MiddleB { leaf: LeafB; }

contract TwoChains {
    branchA: MiddleA;
    branchB: MiddleB;

    init() {
        self.branchA = MiddleA{ leaf: LeafA{ a: 123 } };
        self.branchB = MiddleB{ leaf: LeafB{ b: true } };
    }
}
