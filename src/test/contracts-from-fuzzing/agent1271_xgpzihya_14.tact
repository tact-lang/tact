struct Bottom {
    p: Int = 99;
    q: Bool?;
}

struct Middle {
    child: Bottom?;
    s: String = "hi";
}

contract DeepNestedOpts {
    data: Middle?;
    init() {
        self.data = Middle{
            child: Bottom{ p: 123, q: null },
            s: "test"
        };
    }
    receive() {}
}