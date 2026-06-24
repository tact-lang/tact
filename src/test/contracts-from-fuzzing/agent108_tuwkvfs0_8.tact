struct SubInner {
    score: Int?;
    label: String?;
}

struct Mid {
    sub: SubInner?;
    active: Bool?;
}

struct Container {
    payload: Mid?;
    desc: String?;
}

contract Test7 {
    data: Container;

    init() {
        self.data = Container{
            payload: null,
            desc: null,
        };
    }
}