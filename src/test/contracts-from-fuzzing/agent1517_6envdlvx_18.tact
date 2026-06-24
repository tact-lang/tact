struct Info { age: Int; nickname: String; }

contract MultiMixed {
    owner: Address;
    count: Int as uint16;
    active: Bool;
    tag: String;
    meta: Info;

    init() {
        self.owner = myAddress();
        self.count = 42;
        self.active = true;
        self.tag = "user";
        self.meta = Info{ age: 18, nickname: "anon"};
    }
}