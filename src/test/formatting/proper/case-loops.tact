contract SampleContract {
    x: Int;

    init() {
        self.x = 5;
        while (self.x > 0) {
            self.x = self.x - 1;
        }
        repeat (self.x) {
            self.x += self.x;
        }
        do {
            self.x = self.x + 1;
        } until (self.x < 10);
    }
}