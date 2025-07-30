struct Inner {
    x: Int?;
    y: Int?;
}

struct Container {
    payload: Inner?;
    label: String;
}

contract TestContract {
    box: Container;

    init() {
        self.box = Container{
            payload: Inner{
                x: null,
                y: 123,
            },
            label: "box",
        };
    }
}