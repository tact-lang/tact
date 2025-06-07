struct Wrapped {
    inner: Int?;
}

contract DefaultNull {
    val: Wrapped = Wrapped{ inner: null };

    init() {}
}