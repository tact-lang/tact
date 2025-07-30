struct DeeplyOptional {
  o1: Int?;
  o2: OptionalLayer;
}

struct OptionalLayer {
  o3: Bool?;
  o4: LastLayer?;
}

struct LastLayer {
  value: String?;
}

contract NestedDeepNulls {
    val: DeeplyOptional;

    init() {
        self.val = DeeplyOptional{
            o1: null,
            o2: OptionalLayer{
                o3: null,
                o4: null
            }
        };
    }
}
