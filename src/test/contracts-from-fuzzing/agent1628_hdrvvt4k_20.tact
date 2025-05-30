// optional of a struct that contains an optional
struct Inner {
    innerFlag: Bool?;
}

contract TestContract {
    optStruct: Inner?;

    init() {
        self.optStruct = Inner{ innerFlag: null };
    }
}