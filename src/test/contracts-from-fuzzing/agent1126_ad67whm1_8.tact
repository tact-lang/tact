struct NestedOptBool {
    flag: Bool?;
}

struct WithOptionals {
    a: Int?;
    b: Bool?;
    c: NestedOptBool?;
}

contract OptFields {
    data: WithOptionals;
    init() {
        self.data = WithOptionals{
            a: 999,
            b: null,
            c: null
        };
    }
}