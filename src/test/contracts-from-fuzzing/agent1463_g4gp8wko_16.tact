struct SInner { s: String; }

contract LargeStringsContract {
    a: String;
    b: String;
    c: SInner;

    init() {
        self.a = "abcdefghijklmnopqrstuvwxyz";
        self.b = "0123456789";
        self.c = SInner{ s: "A very long string inside struct" };
    }
}
