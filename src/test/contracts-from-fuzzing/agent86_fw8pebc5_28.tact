// optional of struct with optional of struct
struct Inner { x: Int; }
struct Outer { f: Inner?; }

contract C {
    s: Outer?;

    init() {
        self.s = null;
    }
}