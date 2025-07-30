struct OptStruct {
    val: Int;
}

contract DefaultedOptionalStruct {
    os: OptStruct?;

    init() {
        // no initialization of os
    }
}