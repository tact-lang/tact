struct NestedOptLevel3 { k: Int? }

struct NestedOptLevel2 {
    x: Int?;
    next: NestedOptLevel3?;
}

struct NestedOptLevel1 {
    y: Int?;
    next: NestedOptLevel2?;
}

contract DeepOptionalNesting {
    top: NestedOptLevel1;

    init() {
        self.top = NestedOptLevel1{
            y: null,
            next: NestedOptLevel2{
                x: 123,
                next: NestedOptLevel3{ k: 456 }
            }
        };
    }
}