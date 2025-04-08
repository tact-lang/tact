// Optional top level struct and nested struct with inner optional
struct Inner { val: Int?; }
struct Outer { inner: Inner; label: String; }

contract TopOpt {
    s: Outer? = null;

    init() {
        self.s = Outer{ inner: Inner{ val: 42 }, label: "x" };
    }

    receive() {}
}