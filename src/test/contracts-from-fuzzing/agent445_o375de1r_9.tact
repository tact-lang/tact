struct Level3 {
    deepInt: Int;
    deepStr: String;
}

struct Level2 {
    subInt: Int;
    subOption: Level3?;
}

struct Level1 {
    optInt: Int?;
    next: Level2;
}

contract ComboNestedOption {
    complexData: Level1;

    init() {
        self.complexData = Level1{
            optInt: null,
            next: Level2{
                subInt: 99,
                subOption: Level3{
                    deepInt: 42,
                    deepStr: "hi"
                }
            }
        };
    }
}
