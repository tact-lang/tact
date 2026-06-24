struct Multi {
    i: Int; 
    s: String; 
    b: Bool; 
}

contract NestedOpts {
    wrap: Multi?;

    init() {
        self.wrap = null;
    }
}