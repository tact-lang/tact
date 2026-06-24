struct HasBool {
    f: Bool;
}

contract DefaultBool {
    s: HasBool;

    init() {
        self.s = HasBool{ f: true };
    }
}