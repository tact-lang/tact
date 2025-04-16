trait DemoTrait {
    x: Int;
}

contract WithTrait with DemoTrait {
    x: Int;
    y: String;

    init() {
        self.x = 1;
        self.y = "hello";
    }
}
