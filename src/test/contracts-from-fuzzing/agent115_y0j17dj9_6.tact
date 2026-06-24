struct Mixed {
    i: Int;
    s: String;
    b: Bool;
}

contract StructArray {
    s1: Mixed;
    s2: Mixed;
    s3: Mixed;

    init() {
        self.s1 = Mixed{i: 1, s: "s1", b: true};
        self.s2 = Mixed{i: 2, s: "s2", b: false};
        self.s3 = Mixed{i: 3, s: "s3", b: true};
    }
}