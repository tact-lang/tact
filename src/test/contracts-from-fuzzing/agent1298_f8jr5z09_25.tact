// Combine many structs and primitives
struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: String }
struct S4 { d: Slice }

struct Combo {
    one: S1;
    two: S2;
    three: S3;
    four: S4;
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    sliceVal: Slice;
}

contract HugeComboTest {
    stored: Combo;
    init() {
        self.stored = Combo{
            one: S1{a:1},
            two: S2{b:true},
            three: S3{c:"hi"},
            four: S4{d:emptyCell().asSlice()},
            intVal: 100,
            boolVal: false,
            stringVal: "test",
            sliceVal: emptyCell().asSlice()
        };
    }
}