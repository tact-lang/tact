struct Descendant {
    level: Int;
    child: Child?;
}

struct Child {
    value: Int;
    flag: Bool;
}

contract TestContract {
    desc: Descendant;

    init() {
        self.desc = Descendant{
            level: 1,
            child: Child{
                value: 42,
                flag: true,
            },
        };
    }
}