struct StrNest1 { val: String }
struct StrNest2 { inner: StrNest1 }
struct StrNest3 { inner: StrNest2 }
struct StrNest4 { inner: StrNest3 }

contract TestContract {
    nest: StrNest4;

    init() {
        self.nest = StrNest4{
            inner: StrNest3{
                inner: StrNest2{
                    inner: StrNest1{ val: "hello" }
                }
            }
        };
    }
}
