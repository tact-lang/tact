struct Person { name: String; age: Int; }

contract Test {
    person: Person?;

    init() {
        self.person = null;
    }
}