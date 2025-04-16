trait MyTrait { x: Int }

contract ImplementsTrait with MyTrait {
    x: Int;

    init() { self.x = 42; }
}