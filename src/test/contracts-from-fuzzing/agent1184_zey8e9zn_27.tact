struct Deep1 { val: Int }
struct Deep2 { inner: Deep1 }
struct Deep3 { deeper: Deep2 }
struct Deep4 { d: Deep3 }
struct Deep5 { e: Deep4 }

contract Nested5 {
    field: Deep5;

    init() {
        self.field = Deep5{
            e: Deep4{
                d: Deep3{
                    deeper: Deep2{
                        inner: Deep1{
                            val: 123
                        }
                    }
                }
            }
        };
    }
}