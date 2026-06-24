// Contract with many composite parameters + nested optionals
struct Info { count: Int?; ready: Bool; }

contract C(
    a: Info?,
    b: Info?,
    c: Info?,
    d: Info?,
    e: Info?,
) {
    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
        let _ = self.d;
        let _ = self.e;
    }
}
