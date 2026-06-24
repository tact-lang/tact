struct MultiOption {
    num: Int?;
    flag: Bool?;
}

struct Container {
    a: MultiOption?;
    b: MultiOption?;
    c: MultiOption?;
}

contract MultipleNestedOptions {
    data: Container;
    init() {
        self.data = Container{
            a: null,
            b: MultiOption{ num: 1, flag: true },
            c: null,
        };
    }
}