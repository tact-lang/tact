struct Rec1 {
    a: Int?;
    nested: Rec2?;
}
struct Rec2 {
    x: Bool?;
    nested: Rec3?;
}
struct Rec3 {
    y: String?;
}

contract Test {
    r: Rec1;

    init() {
        self.r = Rec1{
            a: null,
            nested: Rec2{
                x: null,
                nested: Rec3{
                    y: null
                }
            }
        };
    }
}