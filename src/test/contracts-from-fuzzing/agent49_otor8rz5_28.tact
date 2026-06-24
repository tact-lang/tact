struct Contact {
    addr: Address?;
    note: String;
}

struct Directory {
    primary: Contact?;
    backup: Contact?;
}

contract TestContract {
    dir: Directory;

    init() {
        self.dir = Directory{
            primary: null,
            backup: null,
        };
    }
}
