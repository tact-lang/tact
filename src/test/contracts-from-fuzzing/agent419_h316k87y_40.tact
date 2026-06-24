// primitives + nested optional struct
struct Inner {
    s: String?;
}

contract Compose {
    a: Int;
    b: Bool;
    c: Address;
    d: Inner?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = null;
    }
}