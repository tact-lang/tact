struct Info {
    name: String;
    desc: String?;
    url: String;
    note: String?;
}

contract TestContract {
    theInfo: Info;

    init() {
        self.theInfo = Info{
            name: "tact",
            desc: null,
            url: "https://ton.org",
            note: "optional note",
        };
    }
}
