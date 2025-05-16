struct StrNest {
  txt: String;
  next: StrNestOption?;
}

struct StrNestOption {
  data: String?;
}

contract OptionalStringDeep {
  root: StrNest;
  init() {
    self.root = StrNest{
      txt: "root",
      next: null
    };
  }
}