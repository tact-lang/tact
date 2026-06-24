struct StringPair {
    title: String;
    note: String?;
}

contract Test {
    sp: StringPair = StringPair{
        title: "Testing",
        note: null
    };
}