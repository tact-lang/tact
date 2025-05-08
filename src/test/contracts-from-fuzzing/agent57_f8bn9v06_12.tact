struct L1 { v: Int; }
struct L2 { inner: L1; v: Int; }
struct L3 { inner: L2; v: Int; }
struct L4 { inner: L3; v: Int; }
struct L5 { inner: L4; v: Int; }
struct L6 { inner: L5; v: Int; }
struct L7 { inner: L6; v: Int; }
struct L8 { inner: L7; v: Int; }
struct L9 { inner: L8; v: Int; }
struct L10 { inner: L9; v: Int; }
struct L11 { inner: L10; v: Int; }
struct L12 { inner: L11; v: Int; }
struct L13 { inner: L12; v: Int; }
struct L14 { inner: L13; v: Int; }
struct L15 { inner: L14; v: Int; }
struct L16 { inner: L15; v: Int; }
struct L17 { inner: L16; v: Int; }
struct L18 { inner: L17; v: Int; }
struct L19 { inner: L18; v: Int; }
struct L20 { inner: L19; v: Int; }

contract TestDeep20 {
    receive() {
        let obj: L20 = L20 {
            inner: L19 {
                inner: L18 {
                    inner: L17 {
                        inner: L16 {
                            inner: L15 {
                                inner: L14 {
                                    inner: L13 {
                                        inner: L12 {
                                            inner: L11 {
                                                inner: L10 {
                                                    inner: L9 {
                                                        inner: L8 {
                                                            inner: L7 {
                                                                inner: L6 {
                                                                    inner: L5 {
                                                                        inner: L4 {
                                                                            inner: L3 {
                                                                                inner: L2 {
                                                                                    inner: L1 { v: 1 }, v: 2
                                                                                }, v: 3
                                                                            }, v: 4
                                                                        }, v: 5
                                                                    }, v: 6
                                                                }, v: 7
                                                            }, v: 8
                                                        }, v: 9
                                                    }, v: 10
                                                }, v: 11
                                            }, v: 12
                                        }, v: 13
                                    }, v: 14
                                }, v: 15
                            }, v: 16
                        }, v: 17
                    }, v: 18
                }, v: 19
            }, v: 20
        };
        return;
    }
}
