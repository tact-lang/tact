// optional struct where inside nested struct contains optional
struct InnerDeep {
  a: Int?;
}
struct OuterOpt {
  inner: InnerDeep;
  flag: Bool?;
}
contract OptStructInner {
    val: OuterOpt?;
    init() {
        self.val = null;
    }
}