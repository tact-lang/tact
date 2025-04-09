struct D { d1: Int = 1; d2: Bool = true; }
struct C { c1: Int = 2; c2: D = D{}; }
struct B { b1: Int = 3; b2: C = C{}; }
struct A { a1: Int = 4; a2: B = B{}; }
contract X { s: A = A{}; }