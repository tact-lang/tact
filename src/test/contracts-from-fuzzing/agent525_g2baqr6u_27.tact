// optional nested inside struct with explicit null init
struct A { x: Int?; y: Bool?; }

contract Test {
    f: A;

    init() {
        self.f = A{ x: null, y: null };
    }
}