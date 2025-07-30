trait MyTrait {
    x: Int;
}

contract InheritTest with MyTrait {
    x: Int;

    init() {
        self.x = 123;
    }
}