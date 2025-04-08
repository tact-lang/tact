// optional struct value
struct NestedOptional {
    child: Child?;
}

struct Child {
    x: Int;
    y: Bool;
}

contract TestContract {
    no: NestedOptional;

    init() {
        self.no = NestedOptional{
            child: null,
        };
    }
}
