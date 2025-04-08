struct Person {
    name: String;
    age: Int as uint8;
    nickname: String?;
}

contract OptStruct {
    info: Person?;

    init() {
        self.info = null;
    }
}