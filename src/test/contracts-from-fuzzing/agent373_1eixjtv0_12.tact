struct Container {
    first: Int;
    second: Int?;
    third: Bool?;
    fourth: String?;
}

contract MultiOptionals {
    data: Container;

    init() {
        self.data = Container{
            first: 1,
            second: null,
            third: true,
            fourth: null
        };
    }
}