struct HasBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
}

contract TestContract {
    flags: HasBool;

    init() {
        self.flags = HasBool{
            a: true, b: false, c: true, d: false, e: true, f: false
        };
    }
}