// Large nested optional contraction collapse
struct Wrap1 { f: Wrap2?; }
struct Wrap2 { f: Wrap3?; }
struct Wrap3 { f: Wrap4?; }
struct Wrap4 { f: Inner?; }
struct Inner { v: Int?; }

contract NestedCollapseTest {
    val: Wrap1;
    init() {
        self.val = Wrap1{
            f: Wrap2{
                f: Wrap3{
                    f: Wrap4{
                        f: Inner{
                            v: null
                        }
                    }
                }
            }
        };
    }
}
