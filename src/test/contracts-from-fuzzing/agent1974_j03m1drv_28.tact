struct NestedLevel1 { f: Int; o: Int?; }
struct NestedLevel2 { l1: NestedLevel1; b: Bool; }
struct NestedLevel3 { l2: NestedLevel2; z: Int; }

contract BigNest {
    d: NestedLevel3;

    init() {
        self.d = NestedLevel3{
            l2: NestedLevel2{
                l1: NestedLevel1{ f:1, o:null },
                b:true
            },
            z:42
        };
    }
}
