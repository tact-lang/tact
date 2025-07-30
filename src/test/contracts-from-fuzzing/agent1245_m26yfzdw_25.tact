struct Ctx {
    info: InfoObj;
    active: Bool;
}

struct InfoObj {
    id: Int;
    name: String;
    toggle: Bool?;
}

contract InfoStorage {
    ctx: Ctx;

    init() {
        self.ctx = Ctx{
            info: InfoObj{ id: 7, name: "abc", toggle: null },
            active: true,
        };
    }
}
