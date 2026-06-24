struct SubStruct {
 x: Int;
 y: Int;
}

struct OuterWithOpt {
  nested: SubStruct?;
}

contract OptionalNestedStruct {
    val: OuterWithOpt;

    init() {
        self.val = OuterWithOpt{ nested: null };
    }
}