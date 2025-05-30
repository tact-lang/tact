struct A { b: B; optStr: String?; }
struct B { c: C; opt: Int?; }
struct C { val: Int; flag: Bool; }

contract MultiNestedOpt {
    store: A;
    init() {
        self.store = A{
            b: B{
                c: C{ val: 33, flag: true },
                opt: null,
            },
            optStr: null,
        };
    }
}