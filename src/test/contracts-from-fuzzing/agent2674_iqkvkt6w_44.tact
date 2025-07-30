// Optional struct with inline default value null
struct InlineNullOption {
  a: Int? = null;
}

contract TopInlineNullOpt {
    field: InlineNullOption;

    init() {
        self.field = InlineNullOption{};
    }
}