// optional of struct with optional int field with value
struct Inner {
    val: Int?;
}

contract TestContract {
    optStruct: Inner?;
    init() {
        self.optStruct = Inner{ val: 555 };
    }
}