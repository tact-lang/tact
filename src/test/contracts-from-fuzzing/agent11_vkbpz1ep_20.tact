// Mix primitive and nested optional struct fields
struct Child {
    x: Int;
    y: Int;
}

struct Parent {
    flag: Bool;
    childOpt: Child?;
}

contract TestContract {
    state: Parent;

    init() {
        self.state = Parent{
            flag: true,
            childOpt: null
        };
    }
}