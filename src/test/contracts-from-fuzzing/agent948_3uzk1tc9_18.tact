struct S2 { b: Int; }
struct S1 { a: Int; nest: S2; }

struct Top {
    first: S1;
    second: S1;
    third: S1;
}

contract NestedMultiple {
    top: Top;

    init() {
        self.top = Top{
            first: S1{ a: 1, nest: S2{b:10} },
            second: S1{ a: 2, nest: S2{b:20} },
            third: S1{ a: 3, nest: S2{b:30} }
        };
    }
}