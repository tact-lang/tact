struct Inner {
    x: Int as int8;
    name: String;
}

struct Nested {
    count: Int;
    flag: Bool;
    innerOpt: Inner?;
}

contract TestContract {
    data: Nested?;

    init() {
        self.data = Nested{
            count: 77,
            flag: true,
            innerOpt: Inner{
                x: -8,
                name: "Test"
            }
        };
    }
}
