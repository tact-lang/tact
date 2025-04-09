struct DefaultsInside {
    val: Int = 3;
    flag: Bool = false;
}

contract DefaultsInStruct
{
    foo: DefaultsInside;

    init() {
        self.foo = DefaultsInside{};
    }
}