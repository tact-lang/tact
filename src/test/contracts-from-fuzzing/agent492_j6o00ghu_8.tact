struct Payload {
    content: String;
    flag: Bool;
}

contract OptionalStructStorage {
    pl: Payload?;

    init() {
        self.pl = null;
    }
}