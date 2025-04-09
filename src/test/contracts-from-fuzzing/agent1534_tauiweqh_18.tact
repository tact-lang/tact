struct AllOptionals {
    q: Int?;
    r: Bool?;
    s: String?;
}

struct Partial {
    p: Int;
    nested: AllOptionals;
}

contract TestContract {
    data: Partial;

    init() {
        self.data = Partial{
            p: 99,
            nested: AllOptionals{
                q: null,
                r: null,
                s: null,
            },
        };
    }
}