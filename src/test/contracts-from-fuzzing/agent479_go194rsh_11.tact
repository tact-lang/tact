struct Param {
    flag: Bool; 
    value: Int;
}

contract OptionalDeep {
    param: Param?;

    init() {
        self.param = null;
    }
}