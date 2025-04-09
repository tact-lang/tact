struct Child { val: Int; }

struct WithOptStructs {
    s1: Child?;
    s2: Child?;
}

contract TestContract {
    data: WithOptStructs;

    init() {
        self.data = WithOptStructs{
            s1: null,
            s2: null
        };
    }
}