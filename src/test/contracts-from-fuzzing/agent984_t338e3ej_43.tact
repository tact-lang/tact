struct HasNullString {
    s: String? = null;
}

contract NullStringInner {
    h: HasNullString = HasNullString{};
}