struct NestedParams {
    s: String;
    b: Bool;
    i: Int?;
}

contract TestContract {
    params: NestedParams;

    init() {
        self.params = NestedParams{
            s: "hello",
            b: true,
            i: null,
        };
    }
}