struct NestedWithOptionals {
    innerOpt: Int?;
    strOpt: String?;
    flag: Bool;
}

struct Container {
    content: NestedWithOptionals;
    num: Int;
}

contract NestedOptionalsTest {
    data: Container;

    init() {
        self.data = Container{
            content: NestedWithOptionals{
                innerOpt: null,
                strOpt: null,
                flag: true
            },
            num: 21
        };
    }
}