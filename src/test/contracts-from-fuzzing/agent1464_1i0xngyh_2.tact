struct Inner {
    x: Int;
    y: Int?;
    txt: String;
}

contract DeepNested {
    data: Inner;

    init() {
        self.data = Inner{
            x: 5,
            y: null,
            txt: "deep"
        };
    }
}
