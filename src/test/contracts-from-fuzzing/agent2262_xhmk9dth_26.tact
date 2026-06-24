struct L1 { v: Int; }
struct L2 { v: L1; }
struct L3 { v: L2; }
struct L4 { v: L3; }
struct L5 { v: L4; }
struct L6 { v: L5; }
struct L7 { v: L6; }
struct L8 { v: L7; }
struct L9 { v: L8; }
struct L10 { v: L9; }

contract Test {
    deep: L10;

    init() {
        self.deep = L10{
            v: L9{
                v: L8{
                    v: L7{
                        v: L6{
                            v: L5{
                                v: L4{
                                    v: L3{
                                        v: L2{
                                            v: L1{ v: 123 }
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
}