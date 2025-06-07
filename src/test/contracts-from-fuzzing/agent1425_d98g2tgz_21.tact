// test init sets nested optional struct
struct SubOpt {
    v: Int?;
}

struct Container {
    s1: SubOpt?;
}

contract InitNestedOpt {
    data: Container;

    init() {
        self.data = Container{
            s1: SubOpt{ v: null }
        };
    }
}