struct L10 { f: Int; }
struct L9 { inner: L10; f: Int; }
struct L8 { inner: L9; f: Int; }
struct L7 { inner: L8; f: Int; }
struct L6 { inner: L7; f: Int; }
struct L5 { inner: L6; f: Int; }
struct L4 { inner: L5; f: Int; }
struct L3 { inner: L4; f: Int; }
struct L2 { inner: L3; f: Int; }
struct L1 { inner: L2; f: Int; }

contract TestContract {
    receive() {
        let deep: L1 = L1{
            inner: L2{
                inner: L3{
                    inner: L4{
                        inner: L5{
                            inner: L6{
                                inner: L7{
                                    inner: L8{
                                        inner: L9{
                                            inner: L10{ f: 10 },
                                            f: 9
                                        },
                                        f: 8
                                    },
                                    f: 7
                                },
                                f: 6
                            },
                            f: 5
                        },
                        f: 4
                    },
                    f: 3
                },
                f: 2
            },
            f: 1
        };
    }
}
