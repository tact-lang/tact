struct SomeData {
    x: Int;
    y: Bool;
}

contract TestContract {
    optionalData: SomeData?;

    init() {
        self.optionalData = null;
    }
}