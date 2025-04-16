message(1) M1 { v: Int }

struct DeepInner {
  m: M1;
  note: String?;
}

struct Middle {
  flag: Bool;
  din: DeepInner?;
}

struct Complex {
  id: Int;
  mid: Middle;
}

contract DeepComplexStorage {
    comp: Complex;

    init() {
        self.comp = Complex{
            id: 42,
            mid: Middle{
                flag: true,
                din: DeepInner{
                    m: M1{v:123},
                    note:"hi"
                },
            }
        };
    }
}