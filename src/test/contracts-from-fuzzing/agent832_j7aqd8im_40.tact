trait ParentTrait2 {
    x: Int;
}

trait ChildTrait2 with ParentTrait2 {
    x: Int;
    y: Int;
}

contract MultiTraitInheritance with ChildTrait2 {
    x: Int;
    y: Int;
    init() {
        self.x = 5;
        self.y = 6;
    }
    receive() {
        let _ = self.y;
    }
}