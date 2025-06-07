trait Nester { x: Int }

contract NestedTrait with Nester {
    x: Int;
    init() { self.x = 34; }
}