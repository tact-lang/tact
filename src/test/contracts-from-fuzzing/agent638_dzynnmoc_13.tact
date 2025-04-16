struct Info {
    data: String = "Info";
    flag: Bool = true;
}

struct Wrap {
    inner: Info? = Info{};
    count: Int = 5;
}

contract OptionalWithDefaultStruct {
    st: Wrap = Wrap{ inner: Info{}, count: 5 };

    init() {}
}