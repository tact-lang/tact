struct SmallStruct {
  intVal: Int;
  optAddr: Address?;
}

struct MidStruct {
  s1: SmallStruct;
  s2: SmallStruct?;
}

struct BigStruct {
  m1: MidStruct;
  m2: MidStruct;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            m1: MidStruct{
                s1: SmallStruct{ intVal: 11, optAddr: null },
                s2: null
            },
            m2: MidStruct{
                s1: SmallStruct{ intVal: 22, optAddr: null },
                s2: null
            }
        };
    }
}