struct Issue {
    pos: Int;
    flag: Bool;
    text: String;
}

contract DefaultsIssue {
    data: Issue = Issue{ pos: 0, flag: false, text: "hello" };
}