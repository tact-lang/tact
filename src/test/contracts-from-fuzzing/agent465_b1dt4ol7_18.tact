// Optional persistent Storage with nested optional enums
struct S1 {
    x: Int?;
    y: Bool;
}

contract TestContract {
    optionalStruct: S1?;

    init() {
        self.optionalStruct = S1{ x: null, y: false };
    }
}
