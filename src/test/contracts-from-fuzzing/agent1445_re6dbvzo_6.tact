struct Huge {
    f01: Int;
    f02: Int;
    f03: Bool;
    f04: String;
    f05: Bool;
    f06: Int;
    f07: String;
    f08: String;
    f09: Bool;
    f10: Int;
    f11: Bool;
    f12: Int;
    f13: String;
    f14: Int;
    f15: String;
    f16: Bool;
    f17: Int;
    f18: String;
    f19: Bool;
    f20: Int;
}

contract ManyStructFields {
    data: Huge;

    init() {
        self.data = Huge{
            f01: 1, f02: 2, f03: true, f04: "a",
            f05: false, f06: 6, f07: "b", f08: "c",
            f09: true, f10: 10, f11: false, f12: 12,
            f13: "d", f14: 14, f15: "e", f16: true,
            f17: 17, f18: "f", f19: false, f20: 20,
        };
    }
}