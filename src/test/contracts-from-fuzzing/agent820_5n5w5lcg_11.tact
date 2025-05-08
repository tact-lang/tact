struct NestedBool {
    x: Bool;
    y: Bool?;
}

contract TestContract {
    data: NestedBool;
    init() {
        self.data = NestedBool{
            x: true,
            y: null,
        };
    }
}