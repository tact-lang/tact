struct NestedData {
    a: Int;
    b: Bool;
    c: String?;
}

contract TestContract {
    data: NestedData;

    init() {
        self.data = NestedData{
            a: 1,
            b: true,
            c: "test",
        };
    }
}