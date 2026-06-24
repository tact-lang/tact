struct Rec1 {
    next: Rec2?;
}

struct Rec2 {
    next: Rec3?;
}

struct Rec3 {
    val: Int;
}

contract NestedOptionChain {
    data: Rec1;

    init() {
        self.data = Rec1{
            next: Rec2{
                next: Rec3{
                    val: 777,
                },
            },
        };
    }
}
