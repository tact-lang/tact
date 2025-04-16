struct Person { name: String; age: Int; }

contract OptStructField {
    person: Person?;

    init() {
        self.person = null;
    }
}