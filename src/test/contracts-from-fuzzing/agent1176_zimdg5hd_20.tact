struct Leaf { x: Int?; y: Bool?; }
struct Middle { leaf: Leaf?; }
struct Top { mid: Middle?; info: String; }

contract ParamsDeep(
  t: Top
) {
  receive() {
    self.t.info;
  }
}