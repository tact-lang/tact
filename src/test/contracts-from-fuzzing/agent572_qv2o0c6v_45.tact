struct DeepOptionals {
    a: Int?;
    b: Int?;
}

struct NestedDeepOptionals {
    s: DeepOptionals?;
}

contract NestedDeepOptTest {
    s: NestedDeepOptionals;
    init() {
        self.s = NestedDeepOptionals { s:null };
    }
}