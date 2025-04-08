struct HasBool {
    flag: Bool;
}

struct HasString {
    word: String;
}

struct HasIntOption {
    num: Int?;
}

contract MultiStructs {
    f1: HasBool;
    f2: HasString;
    f3: HasIntOption;
    init() {
        self.f1 = HasBool{ flag: true };
        self.f2 = HasString{ word: "stuff" };
        self.f3 = HasIntOption{ num: null };
    }
}