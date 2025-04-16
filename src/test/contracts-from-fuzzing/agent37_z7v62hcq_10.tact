struct A1 { x: Int }
struct A2 { a1: A1 }
struct A3 { a2: A2 }
struct A4 { a3: A3 }
struct A5 { a4: A4 }
struct A6 { a5: A5 }
struct A7 { a6: A6 }
struct A8 { a7: A7 }

contract Test {
    deep: A8;
    init() {
        self.deep = A8{
            a7: A7{
                a6: A6{
                    a5: A5{
                        a4: A4{
                            a3: A3{
                                a2: A2{
                                    a1: A1{
                                        x: 42
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