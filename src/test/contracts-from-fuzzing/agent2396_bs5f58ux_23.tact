struct S1 { a:Int }
struct S2 { b:S1 }

contract RepeatStruct {
    v1: S2;
    v2: S2;

    init() {
        self.v1 = S2{ b: S1{ a: 5 } };
        self.v2 = S2{ b: S1{ a: 10 } };
    }
}