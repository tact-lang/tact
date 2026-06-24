trait TraitA { x: Int }
trait TraitB { y: Bool }

contract Test32 with TraitA, TraitB {
    x: Int;
    y: Bool;
    init() {
        self.x=1;
        self.y=false;
    }
}