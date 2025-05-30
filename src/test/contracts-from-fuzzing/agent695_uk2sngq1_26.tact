struct Person {
    name: String;
    age: Int;
}

contract People {
    p1: Person;
    p2: Person;

    init() {
        self.p1 = Person{name:"Alice", age:30};
        self.p2 = Person{name:"Bob", age:25};
    }
}