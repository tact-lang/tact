struct DefaultOptionalStruct {
    x: Int? = null;
    y: String? = null;
}

contract DefaultOptStructTest {
    s: DefaultOptionalStruct = DefaultOptionalStruct{};
}