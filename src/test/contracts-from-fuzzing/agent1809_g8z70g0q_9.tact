struct InnerMost { val: Int }
struct MidNest { inner: InnerMost }
struct TopNest { mid: MidNest }

contract MultiAssignNested {
    f: TopNest;

    init() {
        self.f = TopNest{
            mid: MidNest{
                inner: InnerMost{ val: 0 }
            }
        };
    }
}