struct L10 { val: Int; }
struct L9 { next: L10; }
struct L8 { next: L9; }
struct L7 { next: L8; }
struct L6 { next: L7; }
struct L5 { next: L6; }
struct L4 { next: L5; }
struct L3 { next: L4; }
struct L2 { next: L3; }
struct L1 { next: L2; }

contract DeepChain {
    data: L1 = L1{
        next: L2{
            next: L3{
                next: L4{
                    next: L5{
                        next: L6{
                            next: L7{
                                next: L8{
                                    next: L9{
                                        next: L10{ val: 777 },
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