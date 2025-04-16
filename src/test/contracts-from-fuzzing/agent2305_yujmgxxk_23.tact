contract ChainNested(
    first: First
) {}

struct First {
    second: Second;
    val: Int;
}

struct Second {
    third: Third;
}

struct Third {
    info: String;
    flag: Bool;
}
