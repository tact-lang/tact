struct Layer1 {
  v1: Int;
  v2: Bool;
  v3: String;
  v4: Address;
  v5: Cell;
}

struct Layer2 {
  l1: Layer1;
  l1opt: Layer1?;
}

struct Layer3 {
  l2: Layer2;
  l2opt: Layer2?;
}

struct Layer4 {
  l3: Layer3;
  l3opt: Layer3?;
}

contract VeryNested {
  v: Layer4;

  init() {
    self.v = Layer4 {
      l3: Layer3 {
        l2: Layer2 {
          l1: Layer1{ v1: 1, v2: true, v3: "txt", v4: myAddress(), v5: emptyCell() },
          l1opt: null,
        },
        l2opt: null,
      },
      l3opt: null,
    };
  }
}