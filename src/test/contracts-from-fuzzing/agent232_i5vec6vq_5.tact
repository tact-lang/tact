struct Deep1 { f: Int }
struct Deep2 { f: Deep1 }
struct Deep3 { f: Deep2 }
struct Deep4 { f: Deep3 }
struct Deep5 { f: Deep4 }
struct Deep6 { f: Deep5 }

contract TestContract {
    deep: Deep6;

    init() {
        self.deep = Deep6{
            f: Deep5{
                f: Deep4{
                    f: Deep3{
                        f: Deep2{
                            f: Deep1{
                                f: 99
                            }
                        }
                    }
                }
            }
        };
    }
}