// Mix of deep nested optional struct chain, explicit null default
struct A { b: B?; }
struct B { c: C?; }
struct C { d: Int?; }

contract DeepChainOptNull {
  x: A = A{ b: null };
}
