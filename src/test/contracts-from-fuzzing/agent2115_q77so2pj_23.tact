// deeply nested structs with optional layers and mix
struct A { x: Int; }
struct B { a: A; y: Bool; }
struct C { b: B?; z: String; }
struct D { c: C?; }
struct E { d: D; }

contract DeepMix {
    e: E = E{ d: D{ c: null } };
    init() {}
}