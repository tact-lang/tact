struct Params {
    name: String = "anon";
    age: Int?; 
}

contract OptDefTest {
    user: Params? = null;

    init() {}
}
