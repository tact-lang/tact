contract Test {
    // Valid invocation of crc32 compile-time function
    a: Int = crc32("test");

    // Valid invocation of ton with integer and float representations
    one: Int = ton("1");            // expected 10^9 nanoToncoin
    pointOne: Int = ton("0.1");      // expected 10^8 nanoToncoin
    nano: Int = ton("0.000000001");  // expected 1 nanoToncoin

    // Valid invocation of rawSlice without and with bit-padding
    s1: Slice = rawSlice("4a");      // should loadUint(8) as 74
    s2: Slice = rawSlice("4a_");     // bit-padded: loads fewer bits

    // Valid invocation of slice with a proper base64 string
    s3: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");

    // Valid invocation of ascii within limits (<=32 bytes)
    a2: Int = ascii("Hello, Tact!");
}
