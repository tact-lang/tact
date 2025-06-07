struct HasBool {
    flag: Bool;
}

contract DefaultBool {
    s: HasBool;

    init() {
        self.s = HasBool{
            flag: false
        };
    }
}
