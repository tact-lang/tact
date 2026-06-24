struct MiddleOpt {
    val: Int?;
}
struct OuterOpt {
    middle: MiddleOpt?;
}
contract NestedOptionalStructs {
    s: OuterOpt;
    init() {
        self.s = OuterOpt{
            middle: null
        };
    }
}