// Nested contract-stored struct with both optional and default-initialized nested struct
struct InnerNested {
  score: Int = 5;
  label: String?;
}

struct OuterNested {
  item: InnerNested?;
}

contract NestedComboStore {
  data: OuterNested;

  init() {
    self.data = OuterNested { item: null };
  }
}
