// contract with many repeated nested optional structs
struct Leaf { a: Int?; }
struct Branch { l: Leaf?; }

contract OptForest {
  b1: Branch?;
  b2: Branch?;
  b3: Branch?;

  init() {
    self.b1 = Branch{ l: null };
    self.b2 = null;
    self.b3 = Branch{ l: Leaf{ a: null } };
  }
}