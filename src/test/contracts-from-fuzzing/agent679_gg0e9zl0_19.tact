// Optional struct with nested optional fields
struct NestedOpt {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    optStruct: NestedOpt?;

    init() {
        self.optStruct = null;
    }
}