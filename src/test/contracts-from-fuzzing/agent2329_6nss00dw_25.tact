struct NestedDeepOpt {
    a: Int;
    b: Bool?;
    s: String;
}

struct TopDeepOpt {
    first: NestedDeepOpt?;
    flag: Bool;
}

contract NestedOptionals {
    val: TopDeepOpt;

    init() {
        self.val = TopDeepOpt{
            first: null,
            flag: true
        };
    }
}
