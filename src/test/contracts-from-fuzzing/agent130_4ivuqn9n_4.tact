struct Mid {
    f: Int?;
    flag: Bool;
}

struct Outer {
    mid: Mid;
    txt: String;
}

contract NestedOptionals {
    data: Outer = Outer{
        mid: Mid{
            f: null,
            flag: true,
        },
        txt: "abc",
    };

    receive() {
        self.data = self.data;
    }
}