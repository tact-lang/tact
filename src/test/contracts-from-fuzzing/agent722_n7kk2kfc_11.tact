struct OneDefault {
    a: Int;
    b: Int = 3;
}

contract Defaults {
    data: OneDefault;

    init() {
        self.data = OneDefault{
            a: 42,
        };
    }
}