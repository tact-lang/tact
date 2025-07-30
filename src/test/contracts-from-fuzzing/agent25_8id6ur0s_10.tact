contract TestStringAsciiWithinLimits {
    const val: Int = ascii("Hello"); // 5 bytes, well within 32 bytes
}