struct Inner {
    flag: Bool;
    amount: Int?;
}

struct Outer {
    nested: Inner?;
    message: String;
    count: Int as uint32;
    big: Int;
}

contract TestStorage {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                flag: true,
                amount: 1000,
            },
            message: "hello",
            count: 1234,
            big: 9999999999,
        };
    }
}
