struct SString {
    s: String;
    t: String?;
}

contract StrOptional {
    so: SString;

    init() {
        self.so = SString{s:"abc", t:null};
    }
}