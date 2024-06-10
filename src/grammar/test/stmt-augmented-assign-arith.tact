fun testFunc(): Int {
    let a: Int = 1;
    let b: Int = 2;
    a += b;
    b += a;
    a += 3;
    a += b + 4;
    b -= 1;
    a -= b;
    a -= b - 1;
    b *= 2;
    a *= b;
    a *= b * 2;
    b /= 2;
    a /= b;
    a /= b / 2;
    a %= 2;
    a %= b;
    a %= b % 2;
    return a;
}