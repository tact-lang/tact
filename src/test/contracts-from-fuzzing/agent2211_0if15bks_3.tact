struct Inner {
    a: Int;
}

struct Middle {
    b: Inner?; // optional nested struct
}

contract OptionalNestedStruct {
    storageField: Middle;
    number: Int = 17;
    
    init() {
        self.storageField = Middle{ b: null };
        self.number = 42;
    }
}