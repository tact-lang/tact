struct Inner { x: Int; y: Bool? }
struct Outer { f: Int; g: Inner }

contract ParamNested(
  data: Outer
) {
  receive() {}
}