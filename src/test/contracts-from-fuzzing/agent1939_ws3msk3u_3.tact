struct Nested {
    s1: Inner1;
    s2: Inner2;
}

struct Inner1 {
    val1: Int;
    val2: Bool;
}

struct Inner2 {
    val3: String;
    val4: Int?;
}

contract TestContract {
    data: Nested;
    init() {
        self.data = Nested{
            s1: Inner1{ val1: 7, val2: false },
            s2: Inner2{ val3: "text", val4: null }
        };
    }
}