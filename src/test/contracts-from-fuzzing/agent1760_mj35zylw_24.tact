struct Head {
    name: String;
    enabled: Bool;
}

struct Tail {
    active: Bool?;
    descr: String;
}

contract MultiComplex {
    first: Head;
    second: Tail;

    init() {
        self.first = Head{name: "start", enabled: true};
        self.second = Tail{active: null, descr: "end"};
    }
}