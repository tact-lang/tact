struct Deep {
    level: Int;
    next: Nested;
}

struct Nested {
    flag: Bool;
}

contract TestContract {
    value: Deep;

    init() {
        self.value = Deep{
            level: 1,
            next: Nested{flag: true},
        };
    }
}