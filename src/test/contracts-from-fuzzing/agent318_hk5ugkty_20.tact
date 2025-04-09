struct A1 { val: Int; }
struct A2 { val: A1; }
struct A3 { val: A2; }
struct A4 { val: A3; }
struct A5 { val: A4; }
struct A6 { val: A5; }
struct A7 { val: A6; }
struct A8 { val: A7; }
struct A9 { val: A8; }

contract VeryDeep {
    deepField: A9;

    init() {
        self.deepField = A9{
            val: A8{
                val: A7{
                    val: A6{
                        val: A5{
                            val: A4{
                                val: A3{
                                    val: A2{
                                        val: A1{val:1}
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