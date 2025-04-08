struct Info {
    id: Int;
    label: String;
}

contract OptDeep {
    d: Info? = null;

    init() {
        self.d = Info{id: 99, label: "label"};
    }
}