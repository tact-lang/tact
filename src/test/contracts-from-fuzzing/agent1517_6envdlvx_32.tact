message(1) A { foo: Int; }
struct S1 { a: A; note: String?; }
struct S2 { s1: S1?; flag: Bool; text: String; }

contract DeepPersistent {
    val: S2;
    init() {
        self.val = S2{
            s1: S1{ a: A{ foo: 9 }, note: null },
            flag: true,
            text: "done"
        };
    }
}