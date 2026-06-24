struct DeeplyNested {
    point: PointWithOptionals;
}

struct PointWithOptionals {
    nested: NestedOptionalLevel1?;
}

struct NestedOptionalLevel1 {
    inner: NestedOptionalLevel2?;
}

struct NestedOptionalLevel2 {
    x: Int?;
    y: Int?;
}

contract TestContract {
    data: DeeplyNested;
    
    init() {
        self.data = DeeplyNested {
            point: PointWithOptionals {
                nested: NestedOptionalLevel1 {
                    inner: NestedOptionalLevel2 {
                        x: null,
                        y: null,
                    }
                }
            }
        };
    }
    
    receive() {
        return;
    }
}
