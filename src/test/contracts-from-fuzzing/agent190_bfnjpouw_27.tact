struct Third {
    id: Int;
    flag: Bool?;
}

struct Second {
    x: Third;
    txt: String;
}

struct First {
    inner: Second;
    comment: String?;
}

contract DeepParams(
    nested: First,
) {}