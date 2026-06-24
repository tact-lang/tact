struct InnerS { val: Int }
struct OuterS { one: InnerS; two: InnerS; }

contract DupStructs {
    outer: OuterS;
    init() {
        self.outer = OuterS{
            one: InnerS{ val: 1 },
            two: InnerS{ val: 2 }
        };
    }
}