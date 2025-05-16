struct Person {
    name: String?;
    age: Int?;
}

contract Test {
    p: Person?;

    init() {
        self.p = null;
    }
}