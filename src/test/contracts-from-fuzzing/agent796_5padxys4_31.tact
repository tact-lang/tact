struct ManyLevels1 { inner: ManyLevels2; }
struct ManyLevels2 { inner: ManyLevels3; }
struct ManyLevels3 { inner: ManyLevels4; }
struct ManyLevels4 { inner: ManyLevels5; }
struct ManyLevels5 { inner: ManyLevels6; }
struct ManyLevels6 { inner: ManyLevels7; }
struct ManyLevels7 { inner: ManyLevels8; }
struct ManyLevels8 { inner: ManyLevels9; }
struct ManyLevels9 { val: Int; }

contract Test {
    nested: ManyLevels1;
    init() {
        self.nested = ManyLevels1{
            inner: ManyLevels2{
                inner: ManyLevels3{
                    inner: ManyLevels4{
                        inner: ManyLevels5{
                            inner: ManyLevels6{
                                inner: ManyLevels7{
                                    inner: ManyLevels8{
                                        inner: ManyLevels9{ val:123 }
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