struct SubData {
    score: Int?;
    valid: Bool;
}

struct User {
    name: String?;
    age: Int?;
    sub: SubData?;
}

contract TestContract {
    user: User?;

    init() {
        self.user = User{
            name: "Alex",
            age: null,
            sub: SubData{ score: 42, valid: true }
        };
    }
}