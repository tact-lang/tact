struct DeepNested {
  s1: Inner1;
}

struct Inner1 {
  s2: Inner2? = null;
}

struct Inner2 {
  s3: Inner3? = null;
}

struct Inner3 {
  flag: Bool = false;
}

contract Test {
  nested: DeepNested = DeepNested{ s1: Inner1{} };
}