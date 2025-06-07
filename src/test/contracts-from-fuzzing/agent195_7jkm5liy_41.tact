struct WithDef {
    a: Int = 5;
    b: Bool = false;
    s: String = "x";
    z: Int?; // implicit null
}

contract PartialOverride {
    st: WithDef;

    init() {
        self.st = WithDef{ b:true };
    }
}
