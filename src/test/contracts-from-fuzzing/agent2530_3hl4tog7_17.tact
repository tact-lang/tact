struct SSub { a: Int; }
struct SMain { s: SSub?; }

contract NestedOptStruct {
    value: SMain;
    init() {
        self.value = SMain{
            s: null
        };
    }
}