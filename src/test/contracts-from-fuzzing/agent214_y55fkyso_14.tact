struct AAA {
    aa: Int;
    ab: String;
}

struct BBB {
    ba: String;
    bb: Bool;
}

struct Contain {
    x: AAA;
    y: BBB;
    z: String;
}

contract DiffStructsField {
    val: Contain;

    init() {
        self.val = Contain{
            x: AAA{ aa: 1, ab: "a" },
            y: BBB{ ba: "b", bb: true },
            z: "c"
        };
    }
}
