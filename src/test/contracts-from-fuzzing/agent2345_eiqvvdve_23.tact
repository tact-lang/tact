struct NameHold {
    name: String;
    nick: String?;
}

contract MultiNames {
    nh1: NameHold;
    nh2: NameHold;
    nh3: NameHold;

    init() {
        self.nh1 = NameHold{ name:"Alice", nick: null };
        self.nh2 = NameHold{ name:"Bob", nick: "Bobby" };
        self.nh3 = NameHold{ name:"Charlie", nick: null };
    }
}