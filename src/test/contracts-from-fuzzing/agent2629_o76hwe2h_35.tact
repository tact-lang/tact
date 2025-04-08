struct HasString {
    s: String;
}

contract BigStringFields {
    s1: HasString = HasString{s:"a"};
    s2: HasString = HasString{s:"b"};
    s3: HasString = HasString{s:"c"};
    s4: HasString = HasString{s:"d"};
    s5: HasString = HasString{s:"e"};

    init() {}
}