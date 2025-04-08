struct DeepNested {
    x: Int;
    y: Bool;
}

struct Middle {
    nested: DeepNested;
}

contract DeepStorage {
    storage: Middle;
    
    init() {
        self.storage = Middle{
            nested: DeepNested{ x: 77, y: false }
        };
    }
}