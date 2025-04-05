contract TestMultipleConstants {
    const A: Int = 10;
    const B: Int = 15;
    const C: Bool = self.A < self.B;
    const D: Int = self.A * self.B; // Expected 150

    receive() {
        if (self.C && self.D == 150) {
            return;
        }
    }
}
