contract TestConstant() {
    // Constant should be evaluated at compile time
    const MOON_RADIUS_KM: Int = 1730 + (8 | 8);

    fun run() {
         // Dump the constant value
         dump(self.MOON_RADIUS_KM);
    }

    receive() {
         self.run();
    }
}
