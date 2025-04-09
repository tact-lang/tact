struct A {
    x: Int;
    y: String;
    z: Bool?;
}

contract OptionalMix {
    optA: A?;
    flag: Bool = true;

    init() {
        self.flag = false;
    }
}