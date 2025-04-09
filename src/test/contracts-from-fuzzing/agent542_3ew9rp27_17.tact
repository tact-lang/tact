struct OptionalBool {
    active: Bool?;
    status: Int;
}

contract TestContract {
    data: OptionalBool;

    init() {
        self.data = OptionalBool{
            active: null,
            status: 1
        };
    }
}