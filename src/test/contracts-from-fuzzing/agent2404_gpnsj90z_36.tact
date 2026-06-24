// Compose many structs + optionals
struct A { val: Int; }
struct B { a: A; flag: Bool; }
struct C { x: Int; y: Bool; }
struct D { b: B?; c: C?; s: String; }

contract CompStructs {
    s: D;
    init() {
        self.s = D{
            b: null,
            c: null,
            s: "abc"
        };
    }
}