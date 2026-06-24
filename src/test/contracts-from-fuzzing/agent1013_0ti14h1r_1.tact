struct Nested {
    val1: Int;
    val2: Bool;
    val3: String;
}

struct Outer {
    nested: Nested;
    flag: Bool;
}

contract TestPersistent {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Nested{val1:10, val2:true, val3:"abc"},
            flag: false
        };
    }
}
