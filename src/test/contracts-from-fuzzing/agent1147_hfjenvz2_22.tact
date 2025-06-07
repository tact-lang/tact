// nested optional primitive fields with defaults or explicit assigns
struct OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract TestContract {
    val: OptionalPrimitives;
    
    init() {
        self.val = OptionalPrimitives{
            intOpt: null,
            boolOpt: null,
            strOpt: null,
        };
    }
}