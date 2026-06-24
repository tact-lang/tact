struct Sub {
  a: Int;
}

struct Container {
  x: Sub?;
}

contract C {
  f: Container = Container{ x: null };
}
