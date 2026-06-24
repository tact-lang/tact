struct ObjA { x: Int = 1; y: Bool = false; }
struct ObjB { msg: String; active: Bool = true; }
struct ObjC { number: Int?; label: String?; }

contract MultiComplex {
    a: ObjA;
    b: ObjB?;
    c: ObjC = ObjC{ number: null, label: "zz" };

    init() {
        self.a = ObjA{ x: 9, y: true };
        self.b = ObjB{ msg: "hello", active: false };
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
    }
}