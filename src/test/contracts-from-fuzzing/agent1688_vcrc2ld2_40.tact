message(44) M4 { val: Int; }

struct S4 { text: String; }

contract TestContract {
    om: M4?;
    os: S4?;

    init() {
        self.om = null;
        self.os = null;
    }
}