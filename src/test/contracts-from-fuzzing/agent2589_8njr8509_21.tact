struct SInner { text: String }

contract DefaultInit {
    inner: SInner = SInner{ text: "abc" };

    init() {
      self.inner = SInner{ text: "xyz" };
    }
}