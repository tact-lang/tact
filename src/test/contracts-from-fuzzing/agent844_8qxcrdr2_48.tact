contract PersistentNumbers {
    i1: Int;
    i2: Int as uint8;
    i3: Int as int16;
    i4: Int as uint32;
    i5: Int;

    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.i3 = 3;
        self.i4 = 4;
        self.i5 = 5;
    }

    receive() {
        let _=self.i2;
        let _=self.i3;
    }
}