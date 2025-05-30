struct Flags {
    owner: String = "default";
    flagA: Bool = true;
    flagB: Bool = false;
    description: String = "none";
    status: Bool = false;
    tag: String = "tag";
    active: Bool = true;
}

contract TestContract {
    data: Flags;

    init() {
        self.data = Flags{
            owner: "Bob",
            flagA: false,
            description: "Test",
            // rest defaults
        };
    }

    receive() {
        let owner = self.data.owner;
        let desc = self.data.description;
        let isActive = self.data.active;
    }
}