struct L0 { a: Int }
struct L1 { a: L0 }
struct L2 { a: L1 }
struct L3 { a: L2 }
struct L4 { a: L3 }
struct L5 { a: L4 }
struct L6 { a: L5 }
struct L7 { a: L6 }
struct L8 { a: L7 }
struct L9 { a: L8 }

contract Level10 {
    l: L9 = L9{
        a: L8{
            a: L7{
                a: L6{
                    a: L5{
                        a: L4{
                            a: L3{
                                a: L2{
                                    a: L1{
                                        a: L0{
                                            a: 42
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    };
}