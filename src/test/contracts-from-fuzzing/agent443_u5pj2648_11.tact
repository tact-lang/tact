struct Innermost { z: String; }
struct Inner2 { y: Innermost; }
struct Inner1 { x: Inner2; }

contract DeepStrings {
    data: Inner1;

    init() {
        self.data = Inner1{ x: Inner2{ y: Innermost{ z: "wow" } } };
    }
}