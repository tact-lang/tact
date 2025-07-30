struct Leaf {
    x: Int = 10;
    y: Bool?;
}
struct Branch {
    l: Leaf;
    s: String = "hi";
}
struct Root {
    b: Branch?;
    z: Int = 42;
}

contract NestedDefaultsOpt {
    r: Root;

    init() {
        self.r = Root{ b:null, z:99 };
    }
}
