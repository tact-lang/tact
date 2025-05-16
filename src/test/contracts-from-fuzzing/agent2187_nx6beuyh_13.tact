struct MultiNest1 { a: Int; }
struct MultiNest2 { b: MultiNest1; }
struct MultiNest3 { c: MultiNest2; }
struct MultiNest4 { d: MultiNest3; }

struct Container {
    e: MultiNest4;
    f: Int;
    g: Bool;
}

contract VariousNested {
    data: Container;

    init() {
        self.data = Container{
            e: MultiNest4{ d: MultiNest3{ c: MultiNest2{ b: MultiNest1{ a: 5 }}}},
            f: 6,
            g: true
        };
    }
}