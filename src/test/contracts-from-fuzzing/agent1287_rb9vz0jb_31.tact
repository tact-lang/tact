// many serialization types but via contract parameter
contract SerParam(
    u8: Int as uint8,
    i16: Int as int16,
    def: Int,
    coinsVal: Int as coins,
    str: String,
    optional: Int?
) {
    receive() {}
}