contract OnlyStrings {
    x: String = "x";
    y: String = "y";
    z: String = "z";
    w: String = "w";

    init() {
        self.x = "a";
        self.y = "b";
        self.z = "c";
        self.w = "d";
    }
}