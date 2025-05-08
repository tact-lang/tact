struct S1 {
  f1: Int;
  f2: String?;
  f3: Address;
}

struct S2 {
  s1a: S1;
  s1b: S1;
  n: Int?;
  s: String;
}

struct S3 {
  s2: S2;
}

contract MultiNestOpt {
    root: S3;

    init() {
        self.root = S3{
            s2: S2{
                s1a: S1{ f1: 1, f2: null, f3: myAddress() },
                s1b: S1{ f1: 2, f2: "hi", f3: myAddress() },
                n: null,
                s: "text"
            }
        };
    }
}
