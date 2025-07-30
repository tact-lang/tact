struct S { val: Int as int8; }

contract SmallIntStruct {
    s: S;
    init() {
        self.s = S{ val: 5 };
    }
}