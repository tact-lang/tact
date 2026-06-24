struct SLeaf {
    x: Int;
}

struct SMid {
    a: SLeaf?;
    b: SLeaf?;
    c: SLeaf?;
}

contract ManyOptionLeaves {
    storage: SMid;

    init() {
        self.storage = SMid{
            a: null,
            b: null,
            c: null
        };
    }
}