struct Layer5 { val: Int; }
struct Layer4 { a: Layer5?; }
struct Layer3 { b: Layer4?; }
struct Layer2 { c: Layer3?; }
struct Layer1 { d: Layer2?; }

contract Opt5Chain {
    root: Layer1?;

    init() {
        self.root = null;
    }
}