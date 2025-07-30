struct DeepNest {
    lvl1: String;
    lvl2: String;
    lvl3: String;
    lvl4: String;
    lvl5: String;
}

contract NestedStrings {
    nest: DeepNest;

    init() {
        self.nest = DeepNest{
            lvl1:"one", lvl2:"two", lvl3:"three", lvl4:"four", lvl5:"five"
        };
    }
}