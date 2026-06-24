struct Combined {
    number: Int;
    flag: Bool;
    text: String;
}

contract BaseDefaults {
    value: Int = 5;
    combo: Combined = Combined{number: 1, flag: false, text: ""};
    optional: String? = null;
}