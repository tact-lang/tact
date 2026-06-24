struct OneField {
    x: Int;
}

struct NestLevel2 {
    f: OneField;
}

struct NestLevel1 {
    f: NestLevel2;
}

contract NestedStruct2 {
    storage: NestLevel1;

    init() {
        self.storage = NestLevel1{
            f: NestLevel2{
                f: OneField{ x: 1 }
            }
        };
    }
}