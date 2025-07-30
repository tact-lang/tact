struct NS1 { v: Int }
struct NS2 { v: NS1 }
struct NS3 { v: NS2 }
struct NS4 { v: NS3 }
struct NS5 { v: NS4 }
struct NS6 { v: NS5 }
struct NS7 { v: NS6 }
struct NS8 { v: NS7 }
struct NS9 { v: NS8 }
struct NS10 { v: NS9 }

contract SuperDeepNest {
    deep: NS10;

    init() {
        self.deep = NS10{
            v: NS9{
                v: NS8{
                    v: NS7{
                        v: NS6{
                            v: NS5{
                                v: NS4{
                                    v: NS3{
                                        v: NS2{
                                            v: NS1{
                                                v: 1
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
}
