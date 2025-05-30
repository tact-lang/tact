struct Nest1 {
    a: Int;
}
struct Nest2 {
    a: Nest1;
}
struct Nest3 {
    a: Nest2;
}
struct Nest4 {
    a: Nest3;
}
struct Nest5 {
    a: Nest4;
}
struct Nest6 {
    a: Nest5;
}
struct Nest7 {
    a: Nest6;
}

contract DeepSevenNest {
    val: Nest7;

    init() {
        self.val = Nest7{
            a: Nest6{
                a: Nest5{
                    a: Nest4{
                        a: Nest3{
                            a: Nest2{
                                a: Nest1{
                                    a: 2024
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}