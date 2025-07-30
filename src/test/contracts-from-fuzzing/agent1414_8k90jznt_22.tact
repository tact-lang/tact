struct Alpha { a: Int; }
struct Beta { b: Bool; }
struct Gamma { g: String; }

contract MultiStructs {
    aa: Alpha;
    bb: Beta;
    cc: Gamma;

    init() {
        self.aa = Alpha { a: 1 };
        self.bb = Beta { b: true };
        self.cc = Gamma { g: "yay" };
    }
}