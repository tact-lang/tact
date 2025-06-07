struct OptionalNested {
    content: String;
    comment: String?;
}

struct Holder {
    nested: OptionalNested?;
    flag: Bool;
}

contract TestContract {
    data: Holder;
    init() {
        self.data = Holder{
            nested: OptionalNested{
                content: "abc",
                comment: null
            },
            flag: true
        };
    }
}
