// Edge case: large struct with mix of optionals/defaults/primitives
struct Mega {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int = 7;
    f8: Bool = true;
    f9: String = "ok";
    f10: Int?;
    f11: Bool?;
    f12: String?;
}

contract MegaMix {
    x: Mega;

    init() {
        self.x = Mega{
            f1: 1, f2: false, f3: "x", f4: null, f5: null, f6: null,
            f7: 77, f8: false, f9: "y", f10: null, f11: null, f12: null,
        };
    }
}