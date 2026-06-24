struct StrNestOpt {
    s: String?;
}

struct Level1 {
    n: StrNestOpt?;
}

contract NestedOptionals {
    data: Level1 = Level1{ n: null };
}