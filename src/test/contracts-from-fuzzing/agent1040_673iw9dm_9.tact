struct InnerData {
    x: Int;
}

contract TestContract {
    optionalStruct: InnerData?;

    init() {
        self.optionalStruct = InnerData{ x: 2024 };
    }
}