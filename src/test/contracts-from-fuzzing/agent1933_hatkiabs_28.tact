struct Embedded {
    label: String;
    count: Int;
}

contract DefaultedEmbedded {
    e: Embedded = Embedded{ label:"test", count:42 };
    init() {}
}