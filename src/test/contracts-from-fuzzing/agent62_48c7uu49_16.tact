struct Person {
    age: Int;
    nickname: String?;
}

contract Test16 {
    profile: Person?;
    init() {
        self.profile = null;
    }
}