struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: Address?;
    o5: Slice?;
}

contract StructWithOptionals {
    v: ManyOptionals;

    init() {
        self.v = ManyOptionals{
          o1: 1,
          o2: null,
          o3: true,
          o4: null,
          o5: null
        };
    }
}