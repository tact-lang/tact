struct Container {
    x: Int;
    y: InnerOpt?;
}

struct InnerOpt {
    s: String;
    flag: Bool?;
}

contract OptInMiddleTest {
    data: Container;

    init() {
        self.data = Container{
            x: 1,
            y: InnerOpt{
                s: "str",
                flag: null
            }
        };
    }
}