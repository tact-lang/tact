struct Compose1 {
    i: Int;
    s: String;
}

struct Compose2 {
    p: Compose1;
    b: Bool;
}

contract ComposeTest {
    p: Compose1;
    q: Compose2;

    init() {
        self.p = Compose1{ i:5, s:"q" };
        self.q = Compose2{ p:self.p, b:true };
    }
}