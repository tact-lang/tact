// Optional struct without default
struct Person {
    name: String;
}
contract OptStructNoDefault {
    friend: Person?;

    init() {
        self.friend = null;
    }
}