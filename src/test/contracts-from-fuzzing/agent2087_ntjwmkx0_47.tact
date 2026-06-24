struct HasString {
    f1: String;
    f2: String;
}

contract TwoStrings {
    s: HasString;

    init() {
        self.s = HasString{f1:"one", f2:"two"};
    }
}