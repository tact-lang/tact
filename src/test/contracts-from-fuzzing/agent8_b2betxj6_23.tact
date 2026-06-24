struct InnerMost { deep: Int }
struct Mid { inner: InnerMost }
struct Top { mid: Mid }

contract MultiNest {
  data: Top;

  init() {
    self.data = Top{
      mid: Mid{
        inner: InnerMost{
          deep: 123
        }
      }
    };
  }
}