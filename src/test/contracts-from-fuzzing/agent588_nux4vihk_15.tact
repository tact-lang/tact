trait TraitX {
    x: Int;
}

contract InheritTest with TraitX {
    x: Int;
    y: Int;

    init() {
        self.x = 1;
        self.y = 2;
    }

    receive() {
        let _ = self.x + self.y;
    }
}