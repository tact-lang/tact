trait MyTrait {
    x: Int;
}

contract WithTrait with MyTrait {
    x: Int;
    init() {
        self.x = 42;
    }
}