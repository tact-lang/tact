contract MixedOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
    a: Int = 5;
    b: Bool = false;
    c: String = "hello";

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.a = 10;
        self.b = true;
        self.c = "world";
    }

    receive() {
        if (self.z != null) {
            dump(self.z!!);
        }
    }
}