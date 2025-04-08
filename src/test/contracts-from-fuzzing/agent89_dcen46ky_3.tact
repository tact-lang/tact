struct DeepNest1 { val: Int; }
struct DeepNest2 { child: DeepNest1; }
struct DeepNest3 { child: DeepNest2; }
struct DeepNest4 { child: DeepNest3; }

contract Fuzz3 {
    payload: DeepNest4;

    init() {
        self.payload = DeepNest4{
            child: DeepNest3{
                child: DeepNest2{
                    child: DeepNest1{ val: 42 },
                },
            },
        };
    }
}