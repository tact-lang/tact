struct NotEmpty {
    i: Int;
}

contract NestedDefaults {
    s: NotEmpty = NotEmpty{ i:5 };
}