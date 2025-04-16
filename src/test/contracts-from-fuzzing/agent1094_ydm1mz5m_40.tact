struct DA {
    a: Int;
}

struct DB {
    b: DA;
}

struct DC {
    c: DB;
}

struct DD {
    d: DC;
}

contract DeepPersist {
    data: DD;
    init() {
        self.data = DD{d: DC{c: DB{b: DA{a:777}}}};
    }
}