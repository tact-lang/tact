struct InnerMost { a: Int; }
struct Middle { m: InnerMost; }
struct OuterMost { o: Middle; }

contract InitWithNested {
  persist: OuterMost;

  init() {
    let tmp = InnerMost{a:42};
    self.persist = OuterMost{ o: Middle{ m: tmp } };
  }
}
