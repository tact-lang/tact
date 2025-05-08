// optional chain of structs including string middle
struct Struct1 {
    str: String?;
    next: Struct2?;
}

struct Struct2 {
    flag: Bool?;
    val: Int?;
}

contract MixChain {
    head: Struct1?;

    init() {
        self.head = null;
    }
}