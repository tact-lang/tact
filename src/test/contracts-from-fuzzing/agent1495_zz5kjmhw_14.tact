struct SubNested {
    a: Int;
    b: Bool;
}

struct Inner {
    s: String;
    o: SubNested;
}

struct Outer {
    x: Int;
    inn: Inner;
}

contract ComplexStorageTest {
    data: Outer;

    init() {
        self.data = Outer{
            x: 7,
            inn: Inner{
                s: "str",
                o: SubNested{a: 1, b: false}
            }
        };
    }
}
