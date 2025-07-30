// contract fields of many nested structs with optional and deeply nested message structs
message(101) InnerM { id: Int }

struct InnerS { foo: String; optM: InnerM? }

struct OuterS { s: InnerS; bar: Int }

contract DeepStorage {
  data: OuterS;

  init() {
    self.data = OuterS{
      s: InnerS{
        foo: "test",
        optM: null
      },
      bar: 8
    };
  }
}
