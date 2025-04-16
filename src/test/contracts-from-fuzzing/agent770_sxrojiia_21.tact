struct One {
    x: Int;
}

struct Two {
    one: One;
    flag: Bool;
}

struct Three {
    two: Two;
    maybeInt: Int?;
}

struct Four {
    three: Three;
    text: String;
}

contract TestContract {
    data: Four;

    init() {
        self.data = Four{
            three: Three{
                two: Two{
                    one: One{x: 1},
                    flag: false
                },
                maybeInt: null
            },
            text: "done"
        };
    }
}