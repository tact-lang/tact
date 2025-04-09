// nested optional inside optional (should fail)
struct Inner { val: Int; }
struct Outer { optInner: Inner?; }

contract C {
    field: Outer?;

    init() {
        self.field = null;
    }
}