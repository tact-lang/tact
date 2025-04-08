struct LargeNesting1 { val: Int }
struct LargeNesting2 { nested: LargeNesting1 }
struct LargeNesting3 { nested: LargeNesting2 }
struct LargeNesting4 { nested: LargeNesting3 }
struct LargeNesting5 { nested: LargeNesting4 }
struct LargeNesting6 { nested: LargeNesting5 }
struct LargeNesting7 { nested: LargeNesting6 }
struct LargeNesting8 { nested: LargeNesting7 }
struct LargeNesting9 { nested: LargeNesting8 }

contract LargeNestingContract {
    data: LargeNesting9;

    init() {
        self.data = LargeNesting9{
            nested: LargeNesting8{
                nested: LargeNesting7{
                    nested: LargeNesting6{
                        nested: LargeNesting5{
                            nested: LargeNesting4{
                                nested: LargeNesting3{
                                    nested: LargeNesting2{
                                        nested: LargeNesting1{val:42}
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
