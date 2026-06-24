struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: Int }

struct Top {
    one: S1;
    two: S2;
    three: S3;
}

contract NestedVariants {
    main: Top;

    init() {
        self.main = Top{
            one: S1{a: 10},
            two: S2{b: false},
            three: S3{c: 30},
        };
    }
}
