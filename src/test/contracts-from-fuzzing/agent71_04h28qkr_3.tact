struct Nested {
    a: Int;
    opt_b: Bool?;
    sub_map: map<Int, Bool>;
}

contract Combo {
    value: Nested;
    flag: Bool;

    init() {
        self.value = Nested{
            a: 10,
            opt_b: null,
            sub_map: emptyMap(),
        };
        self.flag = false;
    }
}