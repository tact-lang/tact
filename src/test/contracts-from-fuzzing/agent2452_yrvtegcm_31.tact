struct MyStruct { x: Int; y: Bool; }

contract DefaultedStruct {
    s: MyStruct = MyStruct{ x: 1, y: true };

    init() {
        self.s = MyStruct{ x: 2, y: false };
    }
}