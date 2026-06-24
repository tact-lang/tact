struct InfoOne {
    count: Int;
}
struct InfoTwo {
    flag: Bool;
}

contract ManyOptionals {
    first: InfoOne?;
    second: InfoTwo?;

    init() {
        self.first = null;
        self.second = InfoTwo { flag: true };
    }
}
