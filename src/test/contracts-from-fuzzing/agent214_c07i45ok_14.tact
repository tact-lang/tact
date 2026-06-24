struct Bunch {
    i1: Int;
    b1: Bool;
    s1: String;
    i2: Int;
    b2: Bool;
    s2: String;
    i3: Int;
    b3: Bool;
    s3: String;
}

contract TestContract {
    field: Bunch;

    init() {
        self.field = Bunch{
            i1: 1, b1: false, s1: "s1",
            i2: 2, b2: true, s2: "s2",
            i3: 3, b3: false, s3: "s3",
        };
    }
}