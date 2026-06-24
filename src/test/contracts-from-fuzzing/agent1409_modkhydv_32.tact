trait TT { x: Int }

contract Test with TT {
    x: Int;
    init() { self.x = 5; }
    receive() { let _=self.x; }
}