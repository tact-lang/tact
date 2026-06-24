// Deep optional struct in state
struct OptionalLevel {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    optStruct: OptionalLevel;

    init() {
        self.optStruct = OptionalLevel{
            a: null,
            b: null,
            c: null,
        };
    }
}