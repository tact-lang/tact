// omit all optional nested fields in nested struct in persistent var
struct Inner { a: Int?; b: Bool?; }
struct Outer { s: Inner; }

contract C {
    o: Outer;
    init() {
        self.o = Outer{ s: Inner{} };
    }
}