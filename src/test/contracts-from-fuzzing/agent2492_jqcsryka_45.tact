struct A {
  i: Int;
  b: Bool;
}

contract NestedDefaultInits {
  a: A = A{i:5,b:true};
}