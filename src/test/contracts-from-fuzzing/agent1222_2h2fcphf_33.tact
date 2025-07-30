struct InlineOpt {
    a: Int?;
}

contract InlineAssignmentNull {
    s: InlineOpt;

    init() {
        self.s = InlineOpt{ a: null };
    }
}