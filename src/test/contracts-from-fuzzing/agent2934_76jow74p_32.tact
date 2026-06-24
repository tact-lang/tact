struct FIN {
    f: Int;
}

struct Wrapper {
    a: FIN?;
}

struct All {
    w: Wrapper;
    x: Int;
    y: Bool;
}

contract DeepOptionStruct {
    s: All;

    init() {
        self.s = All{
            w: Wrapper{ a: null },
            x: 99,
            y: true,
        };
    }
}