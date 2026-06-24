contract TestSelfConstant {
    // Define a contract-level constant, as shown in documentation
    const MOON_RADIUS_KM: Int = 1738;

    // Test a simple function that accesses a contract-level constant via self
    fun getMoonRadius(): Int {
        return self.MOON_RADIUS_KM;
    }

    receive() {
        dump(self.getMoonRadius());
    }
}
