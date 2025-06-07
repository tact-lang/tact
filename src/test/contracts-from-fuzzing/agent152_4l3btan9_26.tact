struct NestedData {
    number: Int;
    flag: Bool;
}

contract TestContract {
    optStruct: NestedData?;
    count: Int = 0;
    status: Bool;

    init() {
        self.optStruct = NestedData{
            number: 42,
            flag: true
        };
        self.status = false;
    }
}
