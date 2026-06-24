struct Nested {
    level2: Inner2;
}

struct Inner2 {
    level3: Inner3;
}

struct Inner3 {
    level4: Int;
    flag: Bool?;
}

contract Test4 {
    val: Nested;

    init() {
        self.val = Nested{ level2: Inner2{ level3: Inner3{ level4: 123, flag: null } } };
    }
    receive() {}
}