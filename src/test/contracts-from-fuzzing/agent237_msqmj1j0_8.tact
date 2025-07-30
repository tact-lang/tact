struct InnerWithOpt {
    a: Int?;
    b: Bool?;
}

struct Outer {
    inner: InnerWithOpt;
    msg: String;
}

contract NestedOptTest {
    persist: Outer;
    init() {
        self.persist = Outer{
            inner: InnerWithOpt{a:null, b:null},
            msg: "abc"
        };
    }
}