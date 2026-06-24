struct MultiNested {
  n1: Int;
  n2: Int?;
  n3: Int;
}

struct Holder {
  fieldA: Int;
  mn: MultiNested;
}

contract NestedStructs {
  h: Holder = Holder{
    fieldA: 1,
    mn: MultiNested {n1: 1, n2: null, n3: 3}
  };
}