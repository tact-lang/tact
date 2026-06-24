// nested optional struct inside another optional struct
struct Sub {
    s: String?;
}

struct Container {
    sub: Sub?;
}

contract NestedOptStructs {
    data: Container;

    init() {
        self.data = Container {
            sub: Sub { s: null }
        };
    }
}
