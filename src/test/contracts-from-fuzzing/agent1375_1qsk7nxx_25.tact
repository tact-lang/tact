struct Embedded {
    intVal: Int;
    optStr: String?;
}

contract EmbedStructContract {
    value: Embedded;
    label: String;

    init() {
        self.value = Embedded{intVal: 10, optStr: null};
        self.label = "Label";
    }
}