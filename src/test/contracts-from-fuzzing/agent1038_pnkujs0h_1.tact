struct InnerData {
    x: Int;
    y: Bool;
    label: String;
}

contract TestContract {
    data: InnerData;

    init() {
        self.data = InnerData{ x: 1, y: true, label: "abc" };
    }
}
