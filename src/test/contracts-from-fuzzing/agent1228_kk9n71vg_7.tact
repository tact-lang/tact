struct Person {
    id: Int;
    nickname: String?;
    country: String = "";
}

contract OptStruct {
    p: Person? = null;

    init() {}
}