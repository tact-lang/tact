struct Alpha { x: Int; }
struct Beta { y: Int; }
struct Gamma { z: Int; }

contract MultiNullStructs {
    a: Alpha?;
    b: Beta?;
    c: Gamma?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}