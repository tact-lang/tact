// Optional nested struct with long strings
struct Deep {
    name: String;
    nick: String;
}

struct Wrap {
    d: Deep?;
}

contract OptDeep {
    w: Wrap;
    init() {
        self.w = Wrap{ d: null };
    }
}