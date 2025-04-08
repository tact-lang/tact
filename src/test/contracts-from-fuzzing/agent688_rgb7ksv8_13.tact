struct Details {
    title: String?;
    desc: String?;
    active: Bool?;
}

struct Container {
    meta: Details;
    comment: String?;
}

contract NestedOptionalsWide {
    content: Container;

    init() {
        self.content = Container{
            meta: Details{
                title: "hi",
                desc: null,
                active: true
            },
            comment: null
        };
    }
}
