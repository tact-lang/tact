struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: Address }
struct S4 { d: Cell }

struct Outer {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
}

contract ComplexNestedStruct {
    data: Outer;

    init() {
        self.data = Outer{
            s1: S1{a: 10},
            s2: S2{b: true},
            s3: S3{c: myAddress()},
            s4: S4{d: emptyCell()},
        };
    }
}