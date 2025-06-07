struct Nested {
    i: Int;
    b: Bool;
}

contract InlineAndDefault {
    s: Nested = Nested{ i:1, b:true };
}
