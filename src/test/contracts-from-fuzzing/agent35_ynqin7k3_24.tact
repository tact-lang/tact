struct S { x: Int; }

contract DefaultsInStruct {
    s: S;

    init() {
        self.s = S{ x: 42 };
    }
}