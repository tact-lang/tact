struct ManyFlags {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract TestContract {
    flags: ManyFlags;

    init() {
        self.flags = ManyFlags{a: true, b: false, c: true, d: false, e: true};
    }

    receive() {
        self.flags = ManyFlags{a: false, b: true, c: false, d: true, e: false};
    }
}