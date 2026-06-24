struct Nested {
    a: Int as int64;
    b: Bool;
    c: Int?;
}

contract TestContract {
    storage1: Nested;
    storage2: Nested;

    init() {
        self.storage1 = Nested{ a:123, b:true, c: null };
        self.storage2 = Nested{ a:-123, b:false, c: 42 };
    }
}