struct Sub {
    q: Int?;
    r: String?;
    s: Bool?;
}

struct Container {
    s1: Sub;
    s2: Sub;
    s3: Sub;
}

contract MultipleNestedOpts {
    data: Container;

    init() {
        self.data = Container{
            s1: Sub{q: null, r: null, s: false},
            s2: Sub{q: 5, r: "", s: null},
            s3: Sub{q: null, r: "hi", s: true}
        };
    }
}
