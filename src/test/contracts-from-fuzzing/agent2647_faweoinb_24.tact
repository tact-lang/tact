struct Perm1 { a: Int; }
struct Perm2 { b: Int; }
struct Perm3 { c: Int; }

contract StructPermutation {
    p1: Perm1;
    p2: Perm2;
    p3: Perm3;

    init() {
        self.p1=Perm1{a:1}; self.p2=Perm2{b:2}; self.p3=Perm3{c:3};
    }
}