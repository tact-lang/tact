struct Base {
    a: Int;
    b: String;
}

struct Wrap {
    base: Base;
    s: String?;
    flag: Bool;
}

contract Wrapped {
    content: Wrap;

    init() {
        self.content = Wrap{
            base: Base{a:5,b:"stuff"},
            s: null,
            flag: false,
        };
    }
}
