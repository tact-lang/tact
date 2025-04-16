struct Nested {
    level: Int;
    flag: Bool;
}

struct Wrapper {
    nested: Nested;
    val: Int;
}

contract DeepStorage {
    wrapper: Wrapper;
    active: Bool;

    init() {
        self.active = true;
        self.wrapper = Wrapper{
            nested: Nested{ level: 100, flag: false },
            val: 5
        };
    }
}