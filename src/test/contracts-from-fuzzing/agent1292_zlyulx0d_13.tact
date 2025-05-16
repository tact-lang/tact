struct WithOptString {
    title: String?;
}

struct ContainsOpt {
    s: WithOptString;
}

contract OptInNested {
    data: ContainsOpt;

    init() {
        self.data = ContainsOpt{
            s: WithOptString{ title: null },
        };
    }
}