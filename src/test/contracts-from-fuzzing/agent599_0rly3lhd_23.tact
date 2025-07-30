struct OptionalStruct {
    s: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    os: OptionalStruct;

    init() {
        self.os = OptionalStruct{ s: null };
    }
}