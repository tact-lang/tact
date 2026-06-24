struct Info {
    s: String = "X";
    b: Bool = false;
    o: Int? = null;
}

contract ManyNested {
    a: Info = Info{s: "one", b: true, o: null};
    b: Info = Info{s: "two", b: false, o: 42};

    init() {}
}
