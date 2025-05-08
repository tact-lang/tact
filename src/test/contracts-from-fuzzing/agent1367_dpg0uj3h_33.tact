struct MultiLevel {
  a: Int;
  b: Inner1;
  c: Inner2;
}

struct Inner1 {
  d: Int?;
  e: Inner3;
}

struct Inner2 {
  f: Int?;
}

struct Inner3 {
  g: Int?;
}

contract MultiBranch {
    val: MultiLevel;

    init() {
        self.val = MultiLevel{
            a: 1,
            b: Inner1{
                d: null,
                e: Inner3{
                    g: null,
                },
            },
            c: Inner2{
                f: null,
            },
        };
    }
}