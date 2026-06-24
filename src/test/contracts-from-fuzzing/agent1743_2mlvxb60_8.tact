struct X {
    val: Int;
    label: String?;
}

struct Y {
    flag: Bool = true;
    sub: X?;
}

contract DefaultsAndOptionals {
    data: Y?;

    init() {
        self.data = null;
    }
}