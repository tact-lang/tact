struct DeepNestA { nested: DeepNestB; }
struct DeepNestB { nested: DeepNestC; }
struct DeepNestC { nested: DeepNestD; }
struct DeepNestD { nested: DeepNestE; }
struct DeepNestE { nested: DeepNestF; }
struct DeepNestF { nested: DeepNestG; }
struct DeepNestG { val: Int?; }

contract VeryDeep {
  st: DeepNestA;

  init() {
    self.st = DeepNestA{
        nested: DeepNestB{
            nested: DeepNestC{
                nested: DeepNestD{
                    nested: DeepNestE{
                        nested: DeepNestF{
                            nested: DeepNestG{
                                val: null,
                            },
                        },
                    },
                },
            },
        },
    };
  }
}