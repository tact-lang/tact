struct Tiny1 { a: Int }
struct Tiny2 { b: Int }
struct Tiny3 { c: Int }

struct Group {
    t1: Tiny1;
    t2: Tiny2;
    t3: Tiny3;
}

contract StructGroupStorage {
    group: Group;
    init() {
        self.group = Group{
            t1: Tiny1{ a: 1 },
            t2: Tiny2{ b: 2 },
            t3: Tiny3{ c: 3 },
        };
    }
}