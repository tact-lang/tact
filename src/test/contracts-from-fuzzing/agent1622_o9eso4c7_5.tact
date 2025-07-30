struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    label: String;
    data: Inner;
}

contract DeepInit {
    state: Outer;

    init() {
        self.state = Outer{
            label: "abc",
            data: Inner{
                x: 7
            }
        };
    }
}