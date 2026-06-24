struct S {
    s: String;
}

contract InlineDefaultString {
    f: S = S{s:"foo"};
}