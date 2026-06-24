struct Deep0 { val: Int; next: Deep1; }
struct Deep1 { val: Int; next: Deep2; }
struct Deep2 { val: Int; next: Deep3; }
struct Deep3 { val: Int; next: Deep4; }
struct Deep4 { val: Int; next: Deep5; }
struct Deep5 { val: Int; next: Deep6; }
struct Deep6 { val: Int; next: Deep7; }
struct Deep7 { val: Int; next: Deep8; }
struct Deep8 { val: Int; next: Deep9; }
struct Deep9 { val: Int; }

contract DeepNest {
    d: Deep0;

    init() {
        self.d = Deep0{
            val:0,
            next: Deep1{
                val:1,
                next: Deep2{
                    val:2,
                    next: Deep3{
                        val:3,
                        next: Deep4{
                            val:4,
                            next: Deep5{
                                val:5,
                                next: Deep6{
                                    val:6,
                                    next: Deep7{
                                        val:7,
                                        next: Deep8{
                                            val:8,
                                            next: Deep9{
                                                val:9
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