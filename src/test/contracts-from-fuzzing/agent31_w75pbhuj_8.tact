contract TestCompoundConstant {
    // This contract combines two compile-time evaluated constants:
    // ton("0.5") returns 500000000 (500 million nanoToncoins) and
    // ascii("⚡") returns 14850721, so their sum is expected to be 500000000 + 14850721.
    const compound: Int = ton("0.5") + ascii("⚡");

    get fun getCompound(): Int {
        return self.compound;
    }
}
