struct NestedOptional {
    flag: Bool?;
    text: String?;
}

struct Outer {
    innerOpt: NestedOptional?;
    value: Int;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            innerOpt: null,
            value: 999
        };
    }
}