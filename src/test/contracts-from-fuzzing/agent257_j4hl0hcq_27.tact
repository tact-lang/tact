struct L1 { x: Int; }
struct L2 { inner: L1; }
struct L3 { inner: L2; }
struct L4 { inner: L3; }
struct L5 { inner: L4; }
struct L6 { inner: L5; }
struct L7 { inner: L6; }
struct L8 { inner: L7; }

contract DeeplyNested {
    val: L8 = L8{
        inner: L7{
            inner: L6{
                inner: L5{
                    inner: L4{
                        inner: L3{
                            inner: L2{
                                inner: L1{
                                    x: 42,
                                }
                            }
                        }
                    }
                }
            }
        }
    };
}