struct S10 {
    v: Int;
}

struct S9 {
    inner: S10;
}

struct S8 {
    inner: S9;
}

struct S7 {
    inner: S8;
}

struct S6 {
    inner: S7;
}

struct S5 {
    inner: S6;
}

struct S4 {
    inner: S5;
}

struct S3 {
    inner: S4;
}

struct S2 {
    inner: S3;
}

struct S1 {
    inner: S2;
}

contract TestContract {
    receive() {
        let d: S1 = S1 {
            inner: S2 {
                inner: S3 {
                    inner: S4 {
                        inner: S5 {
                            inner: S6 {
                                inner: S7 {
                                    inner: S8 {
                                        inner: S9 {
                                            inner: S10 { v: 42 }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
        let value: Int = d.inner.inner.inner.inner.inner.inner.inner.inner.inner.v;
    }
}
