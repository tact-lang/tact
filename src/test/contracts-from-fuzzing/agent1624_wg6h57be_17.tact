struct LeafA { a: Int; }

struct LeafB { b: Int; }

struct BranchA { leaf: LeafA; }

struct BranchB { leaf: LeafB; }

contract TwinDeepBranches {
    branchA: BranchA;
    branchB: BranchB;

    init() {
        self.branchA = BranchA{ leaf: LeafA{ a: 1 } };
        self.branchB = BranchB{ leaf: LeafB{ b: 2 } };
    }
}