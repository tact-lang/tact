// Huge nested struct mix with optionals, defaults, primitives
struct Inner {
    a: Int = 5;
    b: Bool?;
    c: String = "x";
}

struct Middle {
    inn: Inner?;
    y: Bool = false;
}

struct Outer {
    mid: Middle;
    z: String?;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            mid: Middle{ inn: null, y: false },
            z: null
        };
    }
}