struct Inner {
    flag: Bool;
    text: String;
}

struct Middle {
    sub: Inner?;
}

contract BoolStringNested {
    data: Middle;

    init() {
        self.data = Middle{
            sub: Inner{
                flag: true,
                text: "text"
            }
        };
    }
}