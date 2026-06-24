struct DeepOpt {
    inner: Int?;
    flag: Bool;
}

struct Container {
    a: DeepOpt?;
    b: DeepOpt;
}

contract DeepOptTest {
    c: Container;

    init() {
        self.c = Container { a: null, b: DeepOpt{ inner:1, flag:true } };
    }
}