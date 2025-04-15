// func reference

// int math::sqrt(int x) inline {
//   if (x == 0) { return x; }
//   int r = 181;
//   int xx = x;
//   if (xx >= 0x100000000000000000000000000000000) {
//     xx >>= 128;
//     r <<= 64;
//   }
//   if (xx >= 0x10000000000000000) {
//     xx >>= 64;
//     r <<= 32;
//   }
//   if (xx >= 0x100000000) {
//     xx >>= 32;
//     r <<= 16;
//   }
//   if (xx >= 0x10000) {
//     xx >>= 16;
//     r <<= 8;
//   }
//   r = (r * (xx + 65536)) >> 18;
//   repeat(7) {
//     r = (r + x / r) >> 1;
//   }
//   int r1 = x / r;
//   return (r < r1 ? r : r1);
// }
asm fun touch(x: Int) {}

message GetSqrt {
    value: Int;
}

fun externalSqrt(x: Int): Int {
    if (x == 0) {
        return x;
    }

    let r: Int = 181;
    let xx: Int = x;

    if (xx >= 0x100000000000000000000000000000000) {
        xx >>= 128;
        r <<= 64;
    }
    if (xx >= 0x10000000000000000) {
        xx >>= 64;
        r <<= 32;
    }
    if (xx >= 0x100000000) {
        xx >>= 32;
        r <<= 16;
    }
    if (xx >= 0x10000) {
        xx >>= 16;
        r <<= 8;
    }

    r = (r * (xx + 65536)) >> 18;

    repeat (7) {
        r = (r + x / r) >> 1;
    }

    let r1: Int = x / r;

    return (r < r1 ? r : r1);
}

contract Sqrt {
    receive(msg: GetSqrt) {
        touch(externalSqrt(msg.value));
    }
}
