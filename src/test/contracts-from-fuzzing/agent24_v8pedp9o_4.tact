contract TestAugmented {
    receive() {
        let a: Int = 5;
        a += 3;  // 5+3 = 8
        a -= 2;  // 8-2 = 6
        a *= 4;  // 6*4 = 24
        a /= 2;  // 24/2 = 12
        a %= 5;  // 12 mod 5 = 2
        dump(a);
        return;
    }
}
