struct A { x: Int = 1; }
struct B { a: A?; y: Bool = false; }
struct C { b: B?; z: String = ""; }

contract OptionalDeepDefaults {
    cc: C = C{ b: null, z: "" };
}