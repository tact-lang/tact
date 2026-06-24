struct StrNestInner {
  s: String;
}
struct StrNestOuter {
  inner: StrNestInner;
}

contract StrNest {
    data: StrNestOuter;
    init() {
        self.data = StrNestOuter{
            inner: StrNestInner{ s:"nested" }
        };
    }
}
