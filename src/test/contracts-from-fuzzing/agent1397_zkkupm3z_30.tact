struct HasBool {
    flag: Bool;
}

contract TopBool {
    f: HasBool;

    init() {
        self.f = HasBool{ flag: true };
    }
}