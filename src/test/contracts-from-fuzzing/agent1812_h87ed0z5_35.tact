struct S1 { i: Int; }
struct S2 { b: Bool; }
struct S3 { s: String; }
struct S4 { c: Cell; }
struct S5 { sl: Slice; }
struct S6 { bu: Builder; }
struct S7 { a: Address; }

struct Agg {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
    s6: S6;
    s7: S7;
}

contract AggStructContract {
    data: Agg;

    init() {
        self.data = Agg{
            s1: S1{ i: 1 },
            s2: S2{ b: true },
            s3: S3{ s: "hi" },
            s4: S4{ c: emptyCell() },
            s5: S5{ sl: emptyCell().asSlice() },
            s6: S6{ bu: beginCell() },
            s7: S7{ a: myAddress() }
        };
    }
}