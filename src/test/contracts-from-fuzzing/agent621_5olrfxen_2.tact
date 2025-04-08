struct Human { age: Int; }

contract OptionalStructHolder {
    person: Human?;
    init() {
        self.person = null;
    }
}