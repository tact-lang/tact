struct Innermore {
    a: Int;
    b: Bool;
}

struct OuterMore {
    sub: Innermore;
    str: String;
}

contract NestedPrimitives {
    data: OuterMore;

    init() {
        self.data = OuterMore{
            sub: Innermore{ a: 7, b: false },
            str: "test"
        };
    }
}