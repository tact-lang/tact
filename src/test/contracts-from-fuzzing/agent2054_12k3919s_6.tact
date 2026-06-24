struct Strct1 { a: Int; }
struct Strct2 { b: Strct1; }
struct Strct3 { c: Strct2; }
struct Strct4 { d: Strct3; }
struct Strct5 { e: Strct4; }

contract Nested5 {
    state: Strct5 = Strct5{ e: Strct4{ d: Strct3{ c: Strct2{ b: Strct1{ a: 1 }}}}};
}