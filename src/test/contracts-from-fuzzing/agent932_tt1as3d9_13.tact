struct Little { x: Int; y: Bool; }

contract MixedVarsPrimitiveStruct {
    x: Int;
    y: Bool;
    s: Little;

    init() {
        self.x = 42;
        self.y = true;
        self.s = Little{ x: 1, y: false };
    }
}