contract TestIllegalGetter2 {
    // This should disallow get attribute on a non-assembly function, if that is enforced, or compile fine if allowed.
    get fun illegalGetter2(): Int {
        return 123;
    }
}
