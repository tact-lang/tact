struct InnerMost { x: Int; y: Bool; }
struct Mid { inner: InnerMost; z: Int; }
struct Top { mid: Mid; name: String; }

contract DeepNest {
  data: Top;

  init() {
    self.data = Top{
      mid: Mid{
        inner: InnerMost{ x: 1, y: true },
        z: 2
      },
      name: "deep"
    };
  }
}