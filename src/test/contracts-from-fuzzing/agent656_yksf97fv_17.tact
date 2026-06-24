struct Mid1 {
    inn: Int;
}

struct Mid2 {
    inn2: Int?;
}

struct FullNest {
    left: Mid1?;
    right: Mid2?;
    rootFlag: Bool;
}

contract OptionalSides(
    tree: FullNest?,
    info: String,
    enabled: Bool,
) {
}