struct NestedMany {
  i: Int;
  b: Bool;
  addr: Address;
  s: String;
}

struct OuterMany {
  f1: NestedMany;
  f2: NestedMany;
  opt: Bool?;
}

contract MultipleNested {
    field: OuterMany;

    init() {
        self.field = OuterMany{
            f1: NestedMany{ i:1,b:true,addr:myAddress(),s:"A" },
            f2: NestedMany{ i:2,b:false,addr:myAddress(),s:"B" },
            opt: null
        };
    }
}
