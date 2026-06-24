struct RecCase {
    comment: String;
    amount: Int;
}

contract InlineStructValues {
    one: RecCase = RecCase{ comment: "a", amount: 1 };
    two: RecCase = RecCase{ comment: "b", amount: 2 };
    init() {}
}