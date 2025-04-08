struct NestedOpt {
    level: Int?;
    flag: Bool;
}

struct Wrap {
    inner: NestedOpt?
}

contract DeepOptional {
    data: Wrap = Wrap{ inner: null };
}