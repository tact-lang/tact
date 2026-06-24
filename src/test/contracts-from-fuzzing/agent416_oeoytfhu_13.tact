struct InlineNested {
    a: Int;
    b: Bool;
}

contract Test14 {
    x: Int = 1;
    s: InlineNested = InlineNested{ a:10, b:true };
    y: Bool = false;
}