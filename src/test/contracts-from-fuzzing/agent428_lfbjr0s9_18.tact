// variant of optional persistent struct directly in contract
struct OptionalData {
    num: Int;
    flag: Bool;
}

contract TestContract {
    data: OptionalData?;

    init() {
        self.data = null;
    }
}