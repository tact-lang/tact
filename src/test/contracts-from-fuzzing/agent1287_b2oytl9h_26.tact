struct Person {
    name: String;
    age: Int;
}

contract MixedFields {
    id: Int;
    owner: Address;
    nickname: String?;
    bestFriend: Person?;

    init() {
        self.id = 123;
        self.owner = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");
        self.nickname = null;
        self.bestFriend = null;
    }
}