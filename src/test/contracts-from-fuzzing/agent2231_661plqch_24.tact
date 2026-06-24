struct NestedOptionString {
    s: String?;
}

struct OuterStrOpt {
    inn: NestedOptionString?;
    flag: Bool;
}

contract OuterStrOptContract {
    foo: OuterStrOpt;

    init() {
        self.foo = OuterStrOpt{
            inn: null,
            flag: false
        };
    }
}