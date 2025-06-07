struct Bottom {
    foo: Int = 1;
    bar: Bool? = null;
}

struct Middle {
    baz: Int?;
    bottom: Bottom;
}

struct Top {
    mid: Middle;
    label: String;
}

contract TestContract {
    all: Top;

    init() {
        self.all = Top{
            mid: Middle{ baz: null, bottom: Bottom{ foo: 5, bar: null } },
            label: "hi"
        };
    }
}