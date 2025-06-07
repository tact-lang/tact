struct Simple {
    i: Int;
    b: Bool;
    s: String;
}

struct WithDefaults {
    a: Int = 42;
    c: Bool = false;
    d: String = "tact";
}

struct Wrap {
    inner: WithDefaults;
    plain: Simple;
}

contract Defaults {
    data: Wrap;

    init() {
        self.data = Wrap{
            inner: WithDefaults{},
            plain: Simple{i:1, b:true, s:"hi"},
        };
    }
}