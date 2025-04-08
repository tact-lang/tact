struct Inner {
    val: Int?;
    flag: Bool;
}

struct Middle {
    coord: Inner;
    label: String;
}

contract DeepNested {
    data: Middle;

    init() {
        self.data = Middle{
            coord: Inner{ val: null, flag: true },
            label: "text"
        };
    }
}