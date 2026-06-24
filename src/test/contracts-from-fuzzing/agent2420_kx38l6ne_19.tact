// deep optional chain layered twice
struct Rec1 {
    n: Int?;
}
struct Rec2 {
    r1: Rec1?;
}
struct Rec3 {
    r2: Rec2?;
}

contract MultiOptLayers {
    val: Rec3;

    init() {
        self.val = Rec3{
            r2: null,
        };
    }
}