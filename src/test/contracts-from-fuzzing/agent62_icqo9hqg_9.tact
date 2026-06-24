struct S1 {
  x: Int;
}
struct S2 {
  a: S1;
  b: Int;
}
struct S3 {
  s: S2;
  y: Int;
}
contract NestedMix {
    data: S3;
    init() {
        self.data = S3{
            s: S2{
                a: S1{ x: 42 },
                b: 43
            },
            y: 44
        };
    }
}