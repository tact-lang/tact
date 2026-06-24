struct HasStrings {
    s1: String;
    s2: String?;
}

contract NullOptStr {
    val: HasStrings = HasStrings{ s1:"hi", s2:null };
}