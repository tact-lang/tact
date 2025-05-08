struct HasLongDefaults {
    s1: String = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    s2: String = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbb";
    s3: String = "ccccccccccccccccccccccccccccc";
}

contract LongDefaults {
    f: HasLongDefaults = HasLongDefaults{};
    receive() {
        let _ = self.f.s3;
    }
}