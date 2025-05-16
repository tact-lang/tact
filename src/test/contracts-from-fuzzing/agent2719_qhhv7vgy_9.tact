struct Inner {
    a: Int;
}

struct Container {
    content: Inner;
    label: String;
    flag: Bool;
    number: Int;
}

contract StorageTest {
    data: Container;

    init() {
        self.data = Container{
            content: Inner{ a: 3 },
            label: "test",
            flag: false,
            number: 999
        };
    }
}