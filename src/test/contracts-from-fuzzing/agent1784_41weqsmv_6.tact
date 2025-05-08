struct DeeplyNested1 { level2: DeeplyNested2; }
struct DeeplyNested2 { level3: DeeplyNested3; }
struct DeeplyNested3 { level4: DeeplyNested4; }
struct DeeplyNested4 { level5: Int; }

contract TestContract {
    data: DeeplyNested1;

    init() {
        self.data = DeeplyNested1{
            level2: DeeplyNested2{
                level3: DeeplyNested3{
                    level4: DeeplyNested4{
                        level5: 42
                    }
                }
            }
        };
    }
}