// multiple nested optionals (depth 3), top struct optional
struct Bot {
    x: Int;
}
struct Mid {
    bot: Bot?;
}
struct Top {
    mid: Mid?;
}

contract TooDeepOpt(
    top: Top?,
    flag: Bool
) {}
