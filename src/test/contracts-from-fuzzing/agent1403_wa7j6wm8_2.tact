struct Nested {
    s: String;
    opt_num: Int?;
}

struct Outer {
    flag: Bool;
    nest: Nested;
}

contract StorageTest {
    data: Outer;

    init() {
        self.data = Outer{
            flag: false,
            nest: Nested{
                s: "hello",
                opt_num: null,
            },
        };
    }
}