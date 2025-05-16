struct Innermost { a: Int; b: Bool; c: String; }

struct InnerOptional {
    x: Int?;
    y: Bool?;
    z: Innermost?;
}

contract DeepNestedOptional {
    nested: InnerOptional = InnerOptional{};
    receive() {}
}