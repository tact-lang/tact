struct S1 { a: Int }
struct S2 { s1: S1 }

contract WithOptionalStruct {
    optStruct: S2?;
    init() {
        self.optStruct = null;
    }
}