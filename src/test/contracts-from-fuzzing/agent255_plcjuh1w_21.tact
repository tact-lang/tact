struct S1 {
    f: Int as int64;
}

struct S2 {
    embedded: S1;
    flag: Bool;
}

contract SerializeNestedTest {
    val: S2;

    init() {
        self.val = S2{
            embedded: S1{ f:42 },
            flag: true,
        };
    }
}