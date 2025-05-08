contract Test33 {
    x: Int as int1;   // should only allow -1,0
    y: Int as uint1; // should only allow 0,1

    init() {
        self.x = 2;
        self.y = 5;
    }
}
