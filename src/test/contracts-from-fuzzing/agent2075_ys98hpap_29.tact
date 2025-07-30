struct InlineOpt {
    id: Int;
    comment: String?;
}

contract InlineOptional {
    data: InlineOpt;

    init() {
        self.data = InlineOpt{
            id: 42,
            comment: null
        };
    }
}