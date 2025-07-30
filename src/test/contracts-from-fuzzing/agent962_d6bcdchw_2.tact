struct Nested {
  inner1: Bool;
  inner2: Int?;
  inner3: String;
  inner4: Cell;
}

contract StorageNested {
  value: Nested;

  init() {
    self.value = Nested{
      inner1: true,
      inner2: null,
      inner3: "hello",
      inner4: emptyCell()
    };
  }
}