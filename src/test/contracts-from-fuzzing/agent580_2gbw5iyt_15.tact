struct Inner { val: Int }
struct Outer { inner: Inner? }

contract NestedOptionalsExplicit {
    outerOpt: Outer?;

    init() {
        self.outerOpt = Outer {
            inner: Inner { val: 777 }
        };
    }
}