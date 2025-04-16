/* func reference
int math::sqrt(int x) inline {
  if (x == 0) { return x; }
  int r = 181;
  int xx = x;
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
  repeat(7) {
    r = (r + x / r) >> 1;
  }
  int r1 = x / r;
  return (r < r1 ? r : r1);
}
*/

asm fun touch(x: Int) {}

message GetSqrt {
    value: Int;
}

message GetSqrtViaGeomMean {
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

asm fun log2_floor_p1(x: Int): Int { UBITSIZE }

/* func reference
;; computes sqrt(a*b) exactly rounded to the nearest integer
;; for all 0 <= a, b <= 2^256-1
;; may be used with b=1 or b=scale of fixed-point numbers

int geom_mean(int a, int b) inline_ref {
  ifnot (min(a, b)) {
    return 0;
  }
  int s = log2_floor_p1(a);   ;; throws out of range error if a < 0 or b < 0
  int t = log2_floor_p1(b);
  ;; NB: (a-b)/2+b == (a+b)/2, but without overflow for large a and b
  int x = (s == t ? (a - b) / 2 + b : 1 << ((s + t) / 2));
  do {
    ;; if always used with b=2^const, may be optimized to "const LSHIFTDIVC#"
    ;; it is important to use `muldivc` here, not `muldiv` or `muldivr`
    int q = (muldivc(a, b, x) - x) / 2;
    x += q;
  } until (q == 0);
  return x;
}
;; integer square root, computes round(sqrt(a)) for all a>=0.
;; note: `inline` is better than `inline_ref` for such simple functions
int sqrt(int a) inline {
  return geom_mean(a, 1);
}
*/

fun geomMean(a: Int, b: Int): Int {
    if (min(a, b) == 0) {
        return 0;
    }

    let s: Int = log2_floor_p1(a);
    let t: Int = log2_floor_p1(b);
    let x: Int = (s == t ? (a - b) / 2 + b : 1 << ((s + t) / 2));
    let q: Int = 1; // for first iteration 

    do {
        q = (muldivc(a, b, x) - x) / 2;
        x += q;
    } until (q == 0);

    return x;
}

fun externalSqrtViaGeomMean(x: Int): Int {
    return geomMean(x, 1);
}

contract Sqrt {
    receive(msg: GetSqrt) {
        touch(externalSqrt(msg.value));
    }

    receive(msg: GetSqrtViaGeomMean) {
        touch(externalSqrtViaGeomMean(msg.value));
    }
}
