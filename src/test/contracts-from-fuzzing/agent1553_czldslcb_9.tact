struct Sub {
    x: Int;
    y: Bool;
}

contract DefaultsNested {
    s: Sub = Sub{x: 5, y: true};
}