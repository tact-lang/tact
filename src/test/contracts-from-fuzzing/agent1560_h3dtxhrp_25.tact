struct Inner1 {
  a: Int;
}

struct Inner2 {
  b: Bool;
}

struct Container {
  i1: Inner1;
  i2: Inner2;
}

contract TestContract {
    combined: Container = Container{i1: Inner1{a:42}, i2: Inner2{b:true}};
}