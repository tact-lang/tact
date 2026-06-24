// fuzz test: deep nested persistent chain of structs with optional nulls
struct A { child: B?; }
struct B { child: C?; }
struct C { child: D?; }
struct D { child: E?; }
struct E { x: Bool; }

contract TestContract {
  root: A;
  init() { self.root = A{child: null}; }
}