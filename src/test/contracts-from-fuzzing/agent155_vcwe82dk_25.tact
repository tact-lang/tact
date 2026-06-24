struct Leaf {
  val: Int?;
  flag: Bool = false;
}

struct MiddleLow {
  l1: Leaf;
  l2: Leaf;
}

struct MiddleHigh {
  ml: MiddleLow;
  more: Bool = true;
}

struct MidLevel {
  mh1: MiddleHigh;
  mh2: MiddleHigh;
}

contract TestContract {
  field: MidLevel = MidLevel{
    mh1: MiddleHigh{
      ml: MiddleLow{
        l1: Leaf{ val:null, flag:false },
        l2: Leaf{ val:null, flag:false }
      },
      more:true
    },
    mh2: MiddleHigh{
      ml: MiddleLow{
        l1: Leaf{ val:null, flag:false },
        l2: Leaf{ val:null, flag:false }
      },
      more:true
    }
  };

  init() {
    self.field = MidLevel{
      mh1: MiddleHigh{
        ml: MiddleLow{
          l1: Leaf{ val:null, flag:false },
          l2: Leaf{ val:null, flag:false }
        },
        more:true
      },
      mh2: MiddleHigh{
        ml: MiddleLow{
          l1: Leaf{ val:null, flag:false },
          l2: Leaf{ val:null, flag:false }
        },
        more:true
      }
    };
  }
}