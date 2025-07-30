contract NestedOptions {
    optStruct: InnerOpt?;

    init() {
        self.optStruct = null;
    }
}

struct InnerOpt {
    x: Int?;
    y: Bool;
}