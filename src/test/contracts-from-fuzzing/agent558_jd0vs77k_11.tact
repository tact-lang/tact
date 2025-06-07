struct InnerData {
    x: Int?;
    y: Bool?;
    label: String;
}

contract OptionalStructTest {
    data: InnerData? = null;

    init() {
        self.data = InnerData{
            x: 1,
            y: true,
            label: "ok",
        };
    }
}