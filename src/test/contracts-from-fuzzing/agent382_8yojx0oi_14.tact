struct OptionalStructs {
    a: Inner?;
    b: Inner?;
}

struct Inner {
    x: Int;
    y: String;
}

contract OptionalStructsContract {
    data: OptionalStructs;

    init() {
        self.data = OptionalStructs{
            a: null,
            b: Inner{
                x: 10,
                y: "test"
            }
        };
    }
}