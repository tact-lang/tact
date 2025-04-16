struct IncludesBool {
    b: Bool;
}
struct IncludesInt {
    i: Int;
}
struct IncludesBoth {
    intPart: IncludesInt;
    boolPart: IncludesBool;
}

contract Test32 {
    data: IncludesBoth;

    init() {
        self.data = IncludesBoth{
            intPart: IncludesInt{ i: 13 },
            boolPart: IncludesBool{ b: false }
        };
    }
}
