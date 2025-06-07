struct MultiLayered {
    first: Int;
    second: Bool;
    third: String;
    fourth: Int?;
    fifth: Bool?;
    sixth: String?;
}

contract MultiLayerContract {
    data: MultiLayered;

    init() {
        self.data = MultiLayered{
            first: 1,
            second: false,
            third: "test",
            fourth: null,
            fifth: null,
            sixth: "done",
        };
    }
}