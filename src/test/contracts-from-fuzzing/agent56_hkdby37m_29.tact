struct SubA { val: Int }
struct SubB { val: Int }

struct Holder {
    sa: SubA;
    sb: SubB;
}

contract TwoSubs {
    holder: Holder;

    init() {
        self.holder = Holder{
            sa: SubA{ val:1 },
            sb: SubB{ val:2 }
        };
    }
}