contract ManyOptional {
    x: Int? = null;
    y: Int? = null;
    z: Int? = null;

    init() {
        self.x = 1;
        self.y = null;
        self.z = 3;
    }

    receive() {
        self.x = self.x;
    }
}