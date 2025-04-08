// Edge: bit serialization conflict
contract BitsTest {
    small: Int as uint4 = 2; // fits
    smaller: Int as uint1 = 1; // fits
    big: Int as int257 = 123; // full integer
}