struct SubDetails {
    score: Int;
    note: String?;
}

struct MidDetails {
    active: Bool;
    meta: SubDetails?;
}

struct TopLevel {
    username: String;
    main: MidDetails;
}

contract DeepOptionals {
    record: TopLevel;

    init() {
        self.record = TopLevel{
            username: "bob",
            main: MidDetails{
                active: true,
                meta: SubDetails{score: 99, note: "great"}
            }
        };
    }

    receive() {
        let _ = self.record;
    }
}