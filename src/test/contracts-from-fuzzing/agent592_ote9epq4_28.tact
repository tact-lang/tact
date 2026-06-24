struct Person {
    name: String = "anon";
    age: Int;
    note: String?;
}

contract TestContract {
    p: Person;

    init() {
        self.p = Person{ age:30, note:null };
    }

    receive() {}
}