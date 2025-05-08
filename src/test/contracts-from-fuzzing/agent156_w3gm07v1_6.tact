struct InnerOpt {
    val: Int;
    flag: Bool;
}

struct WithNullable {
    maybeInner: InnerOpt?;
    number: Int;
}

contract OptAndNormal {
    data: WithNullable;

    init() {
        self.data = WithNullable{
            maybeInner: InnerOpt{ val: 7, flag: false },
            number: 100
        };
    }
}