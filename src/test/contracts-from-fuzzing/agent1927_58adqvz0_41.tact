struct SA { a:Int }
struct SB { b:Int }

contract VariantAssign {
    dataA: SA;
    dataB: SB;

    init() {
        self.dataA = SA{a:1};
        self.dataB = SB{b:2};
        self.dataA = SA{a:100};
        self.dataB = SB{b:200};
    }
}