trait T1 {
    x: Int;
}

trait T2 {
    y: Bool;
}

contract MultiTrait with T1, T2 {
    x:Int;
    y:Bool;

    init() {
        self.x = 5;
        self.y = true;
    }
}