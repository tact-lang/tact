contract TestSelfAccess() {
    const MOON_RADIUS_KM: Int = 1738;

    fun test() {
        // Testing self identifier access to contract-level constant
        dump(self.MOON_RADIUS_KM);
    }

    receive() {
        self.test();
    }
}
