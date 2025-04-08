// contract persistent field of optional struct with nested optionals inside struct fields

struct S {
    val: Int?;
    flag: Bool?;
}

contract TestContract {
    x: S?;
    init() {
        self.x = null;
    }
}
