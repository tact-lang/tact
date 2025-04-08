struct Inner1 { f1: Int; }
struct Inner2 { f2: Inner1; }
struct Inner3 { f3: Inner2; }
struct Middle { m1: Inner3; m2: Inner3; }
struct Outer { top: Middle; }

contract NestedParallelBranches {
    data: Outer;
    init() {
        self.data = Outer{
            top: Middle{
                m1: Inner3{f3: Inner2{f2: Inner1{f1:1}}},
                m2: Inner3{f3: Inner2{f2: Inner1{f1:2}}}
            }
        };
    }
}