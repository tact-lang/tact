struct NestedOptionalStruct {
    innerInt: Int;
    optInnerBool: Bool?;
}

struct OptionalWrapper {
    wrapped: NestedOptionalStruct?;
}

contract TestContract {
    optStruct: OptionalWrapper;

    init() {
        self.optStruct = OptionalWrapper{
            wrapped: null
        };
    }
}