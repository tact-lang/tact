struct NestedDeep {
  a: Int;
  b: Bool;
  next: NestedDeeper;
}

struct NestedDeeper {
  c: Int;
  d: String;
}

contract TestContract {
    f: NestedDeep;

    init() {
        self.f = NestedDeep{
            a: 1,
            b: false,
            next: NestedDeeper{
                c: 5,
                d: "deepest"
            }
        };
    }
}