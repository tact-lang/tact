struct S { x: Int }

contract PersistsStruct {
    s: S;
    init() {
        self.s = S{ x:99 };
    }
}