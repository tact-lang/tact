struct Middle {
    count: Int;
    text: String;
}

struct Top {
    middle: Middle;
    extra: String?;
}

contract NestedWithOptional {
    content: Top = Top{
        middle: Middle{count: 5, text: "hi"},
        extra: null
    };
}