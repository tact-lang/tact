struct Boo {
    flag: Bool;
}

contract OptionalInStruct {
    data: Boo?;

    init() {
        self.data = null;
    }
}