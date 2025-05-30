struct DeepStruct {
  s1: String;
  s2: Int;
  s3: Inner;
}

struct Inner {
  foo: Bool;
  bar: Inner2;
}

struct Inner2 {
  item: Bool?;
  value: String;
}

contract DeepStructTest {
    storage: DeepStruct;

    init() {
        self.storage = DeepStruct{
            s1: "x",
            s2: 77,
            s3: Inner{
                foo: false,
                bar: Inner2{
                    item: null,
                    value: "deep"
                }
            }
        };
    }
}
