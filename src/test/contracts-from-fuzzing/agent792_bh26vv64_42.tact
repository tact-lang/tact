struct Mixed {
    x: Int;
    y: String = "hi";
    z: Bool;
}

contract TestC {
    m: Mixed;

    init() {
        self.m = Mixed{ x: 1, z: true };
    }
}