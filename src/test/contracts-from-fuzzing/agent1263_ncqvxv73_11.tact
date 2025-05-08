// test uninitialized optional struct persistent storage
struct User {
    name: String;
    active: Bool;
}

contract Test {
    owner: User?;

    init() {
        self.owner = null;
    }
}