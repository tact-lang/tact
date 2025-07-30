struct S0 { val: Int }
struct S1 { s: S0 }
struct S2 { s: S1 }
struct S3 { s: S2 }
struct S4 { s: S3 }
struct S5 { s: S4 }
struct S6 { s: S5 }
struct S7 { s: S6 }
struct S8 { s: S7 }
struct S9 { s: S8 }

contract DeepTenLayers {
    value: S9;

    init() {
        self.value = S9{
            s: S8{
                s: S7{
                    s: S6{
                        s: S5{
                            s: S4{
                                s: S3{
                                    s: S2{
                                        s: S1{
                                            s: S0{ val: 1 },
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