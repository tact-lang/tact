struct S1 {
  a: Int;
  b: Bool;
}

struct S2 {
  c: S1;
  d: String;
}

struct S3 {
  e: S2;
  f: Int;
}

contract NestedStorageTest {
    data: S3;

    init() {
        self.data = S3{
            e: S2{
                c: S1{ a: 5, b: true },
                d: "hi"
            },
            f: 7
        };
    }
}