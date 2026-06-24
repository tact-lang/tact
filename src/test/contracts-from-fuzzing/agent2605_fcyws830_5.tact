struct NestedOptionals {
    inner1: InnerOpt?;
}

struct InnerOpt {
    flag: Bool?;
    count: Int;
}

contract OptNestedContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            inner1: InnerOpt{ flag: true, count: 42 },
        };
    }
}
