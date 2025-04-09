struct A { q: Int; }
struct B { r: Int; a: A; }
struct C { s: Int; b: B?; }

contract WeirdOptional {
    nested: C?;
    receive() {}
}