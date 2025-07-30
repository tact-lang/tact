struct Nested1 {
    val: Int?;
    flag: Bool;
}

struct Nested2 {
    name: String;
    optBool: Bool?;
}

contract MultipleNested {
    first: Nested1;
    second: Nested2;

    init() {
        self.first = Nested1{ val: null, flag: true };
        self.second = Nested2{ name: "abc", optBool: null };
    }
}