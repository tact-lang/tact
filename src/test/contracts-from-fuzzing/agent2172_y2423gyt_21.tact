contract WithConstants {
    const special: Int = 777;
    data: Int;

    init() {
        self.data = self.special;
    }
}