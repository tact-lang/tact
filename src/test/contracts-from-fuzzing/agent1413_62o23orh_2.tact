struct DeepNest3 { level: Int; }
struct DeepNest2 { child: DeepNest3; }
struct DeepNest1 { child: DeepNest2; }

contract ContractDeep {
    data: DeepNest1;
    init() {
        self.data = DeepNest1{
            child: DeepNest2{
                child: DeepNest3{level: 7}
            }
        };
    }
}