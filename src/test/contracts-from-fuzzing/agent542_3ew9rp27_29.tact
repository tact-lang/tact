struct Composite {
    i: Int;
    s: String?;
    b: Bool;
    o: Other?;
}

struct Other {
    x: Int;
    flag: Bool;
}

contract TestC {
    complex: Composite;

    init() {
        self.complex = Composite{
            i: 1,
            s: null,
            b: true,
            o: null
        };
    }
}