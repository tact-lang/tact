struct Inner1 { x: Int; }
struct Inner2 { x: Inner1; }
struct Inner3 { x: Inner2; }
struct Inner4 { x: Inner3; }
struct Inner5 { x: Inner4; }
struct Inner6 { x: Inner5; }
struct Inner7 { x: Inner6; }

contract Deep7 {
    d: Inner7;

    init() {
        self.d = Inner7{ x: Inner6{ x: Inner5{ x: Inner4{ x: Inner3{ x: Inner2{ x: Inner1{ x: 123 }}}}}}};
    }
}