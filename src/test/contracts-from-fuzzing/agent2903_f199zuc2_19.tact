struct BoolNest {
  a: Bool;
  b: Bool?;
}

contract BoolTest {
  f: BoolNest = BoolNest{ a: true, b: null };
}