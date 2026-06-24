struct Nest {
    a: Int;
    b: Bool?;
}

contract DefaultNested {
    val: Nest = Nest{ a: 42, b: null };
}