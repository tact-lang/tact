struct DataBag {
    count: Int;
    title: String;
    active: Bool;
    rating: Int?;
}

contract StringAndOption {
    info: DataBag;

    init() {
        self.info = DataBag{
            count: 99,
            title: "Hello world",
            active: true,
            rating: null
        };
    }
}
