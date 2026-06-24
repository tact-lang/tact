struct Outer {
    num: Int;
}

contract Holder {
    theOuter: Outer?;

    init() {
        self.theOuter = null;
    }
}