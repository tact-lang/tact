contract ConstNonLiteral {
    const A: Int = 10 + 5 * 6 - (3 * 5);

    get fun val(): Int { return self.A; }
}
