struct BoolCrazy {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
    e: Bool;
    f: Bool?;
    g: Bool;
    h: Bool?;
}

contract TestContract {
    data: BoolCrazy;

    init() {
        self.data = BoolCrazy{
            a: true,
            b: null,
            c: false,
            d: true,
            e: false,
            f: null,
            g: true,
            h: false,
        };
    }
}