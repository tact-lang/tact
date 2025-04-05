const moon_radius: Int = 1730 + (8 | 8);

contract TestMoonRadius() {
    // Getter returns the compile-time evaluated constant
    get fun getMoonRadius(): Int {
        return moon_radius;
    }
    
    // Dummy receiver
    receive() {}
}
