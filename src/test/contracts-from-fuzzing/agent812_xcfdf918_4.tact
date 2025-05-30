struct Nested {
    inn: Inner;
    num: Int;
}

struct Inner {
    flag: Bool;
    count: Int;
}

contract DeepNested {
    data: Nested;

    init() {
        self.data = Nested{inn: Inner{flag: false, count: -1}, num: 5};
    }
}