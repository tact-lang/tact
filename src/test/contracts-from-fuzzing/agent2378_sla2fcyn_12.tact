struct SiblingA { a: Int; }
struct SiblingB { b: Int; }

struct ParentNest {
    left: SiblingA;
    right: SiblingB;
    middle: Int; 
}

contract SiblingStorage {
    content: ParentNest;
    init() {
        self.content = ParentNest{
            left: SiblingA{a:1},
            right: SiblingB{b:2},
            middle: 3
        };
    }
}