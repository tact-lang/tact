struct Sub1 { v1: Int; }
struct Sub2 { v2: Sub1; }
struct Sub3 { v3: Sub2; }
struct Sub4 { v4: Sub3; }
struct Sub5 { v5: Sub4; }
struct Sub6 { v6: Sub5; }
struct Sub7 { v7: Sub6; }
struct Sub8 { v8: Sub7; }

contract EightNest {
    val: Sub8;

    init() {
        self.val = Sub8{
            v8: Sub7{
                v7: Sub6{
                    v6: Sub5{
                        v5: Sub4{
                            v4: Sub3{
                                v3: Sub2{
                                    v2: Sub1{ v1: 123 }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}