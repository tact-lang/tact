struct Inner {
    x: Int?;
    y: Int?;
}

struct Outer {
    label: String?;
    payload: Inner?;
    count: Int?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            label: "hello",
            payload: Inner{
                x: 3,
                y: null,
            },
            count: null,
        };
    }
}