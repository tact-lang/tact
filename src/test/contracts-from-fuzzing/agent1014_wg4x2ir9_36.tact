struct NestedOptional {
  inn: Inner?;
}

struct Inner {
  x: Int;
}

contract C {
  no: NestedOptional = NestedOptional{ inn: null };
}
