struct DeepA { x:Int }
struct DeepB { y:Int }
struct DeepC { z:Int }

struct Aggregate {
    da:DeepA;
    db:DeepB;
    dc:DeepC;
}

contract ManualLayer {
    agg: Aggregate;

    init() {
        self.agg = Aggregate{
            da: DeepA{x:1},
            db: DeepB{y:2},
            dc: DeepC{z:3}
        };
    }
}