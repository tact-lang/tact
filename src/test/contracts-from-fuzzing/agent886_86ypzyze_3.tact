struct Inner {
    flag: Bool;
    name: String;
}

struct Middle {
    id: Int;
    info: Inner;
}

struct Outer {
    data: Middle;
    more: String;
}

contract TestContract {
    content: Outer;
    init() {
        self.content = Outer{
            data: Middle{
                id: 99,
                info: Inner{
                    flag: true,
                    name: "deep"
                }
            },
            more: "outer"
        };
    }
}