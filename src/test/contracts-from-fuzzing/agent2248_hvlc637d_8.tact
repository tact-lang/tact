struct Sub {
    number: Int;
    note: String;
}

struct Container {
    sub1: Sub;
    sub2: Sub;
    sub3: Sub;
}

contract MultiNested {
    value: Container;

    init() {
        self.value = Container{
            sub1: Sub{number: 1, note: "one"},
            sub2: Sub{number: 2, note: "two"},
            sub3: Sub{number: 3, note: "three"}
        };
    }
}