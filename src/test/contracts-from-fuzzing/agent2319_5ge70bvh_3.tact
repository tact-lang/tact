struct InnerData {
    a: Int;
    b: Bool?;
}

struct OuterData {
    s: String;
    inner: InnerData;
    maybeNum: Int?;
}

contract TestContract {
    data: OuterData;

    init() {
        self.data = OuterData{
            s: "nested",
            inner: InnerData{
                a: 7,
                b: null,
            },
            maybeNum: 42,
        };
    }
}
