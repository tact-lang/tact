struct X1 { a: Int }
struct X2 { x1: X1 }
struct X3 { x2: X2 }
struct X4 { x3: X3 }
struct X5 { x4: X4 }
struct X6 { x5: X5 }
struct X7 { x6: X6 }
struct X8 { x7: X7 }
struct X9 { x8: X8 }

contract Test12 {
    deep: X9;

    init() {
        self.deep = X9{
            x8: X8{
                x7: X7{
                    x6: X6{
                        x5: X5{
                            x4: X4{
                                x3: X3{
                                    x2: X2{
                                        x1: X1{
                                            a: 42,
                                        },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        };
    }
}