// Very deep nested optional structs in parameter
struct L4 { x: Int?; }
struct L3 { l4: L4?; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; }

contract ParamVeryDeep(
  deep: L1?,
) {
  receive() {}
}