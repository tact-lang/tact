struct Combo {
    i: Int = 42;
    j: Int?;             // implicitly null
    s: String = "Hi";
    optS: S?;            // implicitly null
}

struct S {
    x: Int = 7;
}

contract ComboTest {
    c: Combo;
    init() {
        self.c = Combo{
            i: 99,
            j: null,
            s: "Yo",
            optS: S{x: 100}
        };
    }
    receive() {}
}