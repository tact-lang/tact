struct Info {
    title: String;
    size: Int?;
}

struct Wrapper {
    main: Info?;
    count: Int?;
}

contract OptionalStructField {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            main: Info{
                title: "Doc",
                size: null,
            },
            count: null,
        };
    }
}