struct A { f1: Int; f2: Bool; f3: String; f4: Int?; }
struct B { fa: A; fb: A; fc: A; }

contract Test {
    b: B;

    init() {
        self.b = B{
            fa: A{ f1: 1, f2: true, f3: "a", f4: null },
            fb: A{ f1: 2, f2: false, f3: "b", f4: null },
            fc: A{ f1: 3, f2: true, f3: "c", f4: null }
        };
    }
}