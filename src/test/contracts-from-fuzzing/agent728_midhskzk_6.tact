struct Person {
    name: String;
    age: Int;
}

struct Container {
    person: Person?;
    extra: Bool;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            person: null,
            extra: true
        };
    }
}