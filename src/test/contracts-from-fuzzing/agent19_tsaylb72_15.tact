struct Levels {
    a: Int?;
    b: Bool?;
    c: String;
}

contract DefaultsOptionals {
    l1: Levels = Levels{
        a: null,
        b: null,
        c: "start"
    };

    init() {
        self.l1.c = "done";
    }
}
