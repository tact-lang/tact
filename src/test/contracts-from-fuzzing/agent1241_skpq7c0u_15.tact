struct A1 { x: Int }
struct A2 { a1: A1 }
struct A3 { a2: A2 }
struct A4 { a3: A3 }
struct A5 { a4: A4 }
struct A6 { a5: A5 }
struct A7 { a6: A6 }

contract Deep7 {
    d: A7;

    init() {
        self.d = A7{
            a6: A6{
                a5: A5{
                    a4: A4{
                        a3: A3{
                            a2: A2{
                                a1: A1{
                                    x: 7,
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}
