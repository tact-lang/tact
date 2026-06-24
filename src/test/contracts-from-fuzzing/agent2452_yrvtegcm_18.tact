struct Num {
    x: Int;
}

contract OptionalDefault {
    maybeNum: Num?; 
    init() {
        self.maybeNum = null;
    }
}