struct OuterWrap {
    a: Int;
    b: Bool;
    c: String;
}

struct Container {
    wrapped: OuterWrap;
    flag: Bool;
    label: String;
}

contract WrapCont {
    content: Container;

    init() {
        self.content = Container {
            wrapped: OuterWrap { a:5, b:true, c: "s" },
            flag: false,
            label: "lbl"
        };
    }
}