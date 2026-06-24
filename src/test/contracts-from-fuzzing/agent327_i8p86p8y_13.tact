message(3) MsgInner {
    foo: Int?;
}

struct SInner {
    bar: Bool?;
    m: MsgInner?;
}

struct Container {
    s: SInner?;
    m2: MsgInner?;
}

contract MixedNestOptTest {
    data: Container = Container{
        s: null,
        m2: MsgInner{ foo: null }
    };
    init() {}
}