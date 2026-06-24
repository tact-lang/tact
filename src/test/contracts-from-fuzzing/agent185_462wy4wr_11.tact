struct Flags {
    flagA: Bool;
    flagB: Bool;
    flagC: Bool;
    flagD: Bool;
}

contract ManyBools {
    flags: Flags;

    init() {
        self.flags = Flags{
            flagA: true,
            flagB: false,
            flagC: true,
            flagD: false
        };
    }
}