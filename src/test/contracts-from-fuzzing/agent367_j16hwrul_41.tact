// optional field of a nested optional containing struct
struct Bottom {
    x: Int?;
}

struct Middle {
    low: Bottom?;
}

contract TestNestedOptionals {
    storage: Middle?;
    init() {
        self.storage = null;
    }
}