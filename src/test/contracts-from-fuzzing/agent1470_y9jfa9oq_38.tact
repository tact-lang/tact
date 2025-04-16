// Contract with huge struct nested more than 5 levels, many optionals
struct L1 { val: Int?; }
struct L2 { nested: L1?; }
struct L3 { nested: L2?; }
struct L4 { nested: L3?; }
struct L5 { nested: L4?; }
struct L6 { nested: L5?; }

contract SixLevelOpt {
  deep: L6;

  init() {
    self.deep = L6{ nested: L5{ nested: L4{ nested: L3{ nested: L2{ nested:L1{val:null} } } } } };
  }
}