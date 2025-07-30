struct LargeNested {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct Container {
    first: LargeNested;
    second: LargeNested;
}

contract BigNestedContract {
    storage: Container;

    init() {
        self.storage = Container{
            first: LargeNested{
                a: 1, b: "hi", c: true, d: null, e: false, f: null
            },
            second: LargeNested{
                a: 2, b: "bye", c: false, d: 10, e: null, f: "stuff"
            }
        };
    }
}