struct InnerMost {
    leaf: Int?;
}

struct Middle {
    child: InnerMost;
}

struct Outer {
    node: Middle;
}

contract DeepOptional {
    data: Outer;
    init() {
        self.data = Outer{ node: Middle{ child: InnerMost{ leaf: null } } };
    }
}
