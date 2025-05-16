struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    nested1: Nested; 
    nested2: Nested; 
    someFlag: Bool;
    someCount: Int;
    init() {
        self.nested1 = Nested{a: 10, b: true};
        self.nested2 = Nested{a: 20, b: false};
        self.someFlag = false;
        self.someCount = 42;
    }
}