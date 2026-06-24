struct DeepNested { inn1: Int; inn2: Bool; inn3: String; }

struct MidNested { mid1: Int; deep: DeepNested; mid2: String; }

struct TopNested { top1: Int; mid: MidNested; top2: Bool; }

contract DeepNestContract {
    nested: TopNested = TopNested{
        top1: 1,
        top2: true,
        mid: MidNested{
            mid1: 2,
            mid2: "mid",
            deep: DeepNested{ inn1: 3, inn2: false, inn3: "deep" }
        }
    };

    init() {
        self.nested = TopNested{
            top1: 10,
            top2: false,
            mid: MidNested{
                mid1: 20,
                mid2: "changed",
                deep: DeepNested{ inn1: 30, inn2: true, inn3: "changed deep" }
            }
        };
    }
}