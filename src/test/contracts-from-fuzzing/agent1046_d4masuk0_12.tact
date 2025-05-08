struct S3 { i: Int; }
struct S2 { nested: S3; flag: Bool; }
struct S1 { nested: S2; text: String; }

contract Chain {
  data: S1 = S1{
    nested: S2{
      nested: S3{ i: 777 },
      flag: false
    },
    text: "hello"
  };
}
