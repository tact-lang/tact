struct InitOverride {
    num: Int = 123;
    flag: Bool = false;
}

contract TestContract {
    val: InitOverride = InitOverride{
        num: 999,
        flag: true
    };
}