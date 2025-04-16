struct SLevel4 { val: Int; }
struct SLevel3 { f: SLevel4; }
struct SLevel2 { f: SLevel3; }
struct SLevel1 { f: SLevel2; }

contract Test {
    root: SLevel1;

    init() {
        self.root = SLevel1{ f: SLevel2{ f: SLevel3 { f: SLevel4{val: 999} } } };
    }
}
// four-level deep nested structs persisted