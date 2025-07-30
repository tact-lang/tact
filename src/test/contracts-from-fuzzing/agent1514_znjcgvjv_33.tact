struct Compose1 { a: Int }
struct Compose2 { b: Compose1 }

contract OptionallyNested {
    val: Compose2?;
    init() {
        self.val = null;
    }
}