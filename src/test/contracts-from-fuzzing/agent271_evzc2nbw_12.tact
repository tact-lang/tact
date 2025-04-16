struct MultiNested1 { a: Int; }
struct MultiNested2 { b: MultiNested1; }
struct MultiNested3 { c: MultiNested2; }
struct MultiNested4 { d: MultiNested3; }

contract MultiDeepTest {
    s: MultiNested4;

    init() {
        self.s = MultiNested4{ d: MultiNested3{ c: MultiNested2{ b: MultiNested1{ a: 5 } } } };
    }
}
