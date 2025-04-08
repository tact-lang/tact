struct BottomOpt { v: Int; }

struct MidOpt1 { m: BottomOpt?; }

struct MidOpt2 { m: MidOpt1?; }

struct MidOpt3 { m: MidOpt2?; }

contract DeepOptAssign {
    val: MidOpt3;

    init() {
        self.val = MidOpt3{
            m: MidOpt2{
                m: MidOpt1{
                    m: BottomOpt{ v: 777 }
                }
            }
        };
    }
}