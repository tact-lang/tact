struct Small1 { f1:Int; }
struct Small2 { f2:Small1; }
struct Small3 { f3:Small2; }
struct Small4 { f4:Small3; }

contract Chain4 {
    data: Small4;

    init() {
        self.data = Small4{
            f4: Small3{
                f3: Small2{
                    f2: Small1{
                        f1: 7
                    }
                }
            }
        };
    }
}
